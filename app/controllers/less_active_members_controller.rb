class LessActiveMembersController < ApplicationController
  before_action :set_less_active_member, only: [:show, :edit, :update, :destroy, :resource]
  before_action :load_less_active_members, only: [:index, :import_names]
  before_action :decorate_less_active_member, only: [:edit, :edit_next]

  # GET /less_active_members
  # GET /less_active_members.json
  def index
    @clean_import_names = LessActiveMemberNames.new
  end

  # GET /less_active_members/1
  # GET /less_active_members/1.json
  def show
  end

  # GET /less_active_members/new
  def new
    @less_active_member = LessActiveMember.new
  end

  # GET /less_active_members/1/edit
  def edit
  end

  # GET /less_active_members/1/resource/1
  def resource
    anchor_base = '/Users/davidvezzani/Documents/member-contact-information'
    @less_active_member.resources if @less_active_member.resources_raw.nil?
    
    file = "#{@less_active_member.resources_raw.split(/[\r\n]+/)[params[:rid].to_i]}"
    full_path = "#{anchor_base}/#{file}"

    if(file.length > 0 and File.exists?(full_path))
      pdf = File.open(full_path, 'rb')
      #send_data pdf, filename: full_path, type: :pdf
      send_file(pdf, filename: full_path, type: 'application/pdf', content_length: File.size(full_path), disposition: :inline)
    else
      redirect_to edit_less_active_member_url(@less_active_member), notice: 'File not found; please provide.'
    end
  end

  # GET /less_active_members/1/edit
  def edit_next
    @less_active_members = LessActiveMemberDecorator.decorate_collection(LessActiveMember.no_new_address.order('surname, given_name asc'))
    @less_active_member = @less_active_members.first
    render :edit
  end

  # POST /less_active_members
  # POST /less_active_members.json
  def create
    clean_less_active_member{|attrs| LessActiveMember.new(attrs)}

    respond_to do |format|
      if(@clean_less_active_member_params.success? and @less_active_member.save)
        format.html { redirect_to @less_active_member, notice: 'Less active member was successfully created.' }
        format.json { render :show, status: :created, location: @less_active_member }
      else
        format.html { render :new }
        format.json { render json: @less_active_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /import_names
  # POST /import_names.json
  def import_names
    @clean_import_names = LessActiveMemberNames.new(import_names_params)
    
    respond_to do |format|
      if(@clean_import_names.save)
        format.html { redirect_to less_active_members_url, notice: 'Less active member names were successfully imported.' }
        format.json { render :index, status: :created, location: @clean_import_names }
      else
        format.html { 
          render :index 
        }
        format.json { render json: @clean_import_names.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /less_active_members/1
  # PATCH/PUT /less_active_members/1.json
  def update
    clean_less_active_member
    #clean_less_active_member{|attrs| LessActiveMember.new(attrs)}

    respond_to do |format|
      if(@clean_less_active_member_params.success? and @less_active_member.update(@clean_less_active_member_params.result))
        format.html { redirect_to less_active_member_url(@less_active_member), notice: 'Less active member was successfully updated.' }
        format.json { render :show, status: :ok, location: @less_active_member }
      else
        format.html { render :edit }
        format.json { render json: @less_active_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /less_active_members/1
  # DELETE /less_active_members/1.json
  def destroy
    @less_active_member.destroy
    respond_to do |format|
      format.html { redirect_to less_active_members_url, notice: 'Less active member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_less_active_member
    @less_active_member = LessActiveMemberDecorator.decorate(LessActiveMember.find(params[:id]))
  end

  def decorate_less_active_member
    @less_active_member = LessActiveMemberDecorator.decorate(@less_active_member)
  end

  def clean_less_active_member(&blk)
    @clean_less_active_member_params = LessActiveMemberCreate.run(less_active_member_params)
    if @clean_less_active_member_params.success?
      @less_active_member = blk.call(@clean_less_active_member_params.result) unless blk.nil?
    else
      @less_active_member = blk.call(less_active_member_params) unless blk.nil?
      @less_active_member.errors.add(:surname, "Unable to process mutations: #{@clean_less_active_member_params.errors.to_json}")
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def less_active_member_params
    clean_params = params.require(:less_active_member).permit(:surname, :given_name, :current_address, :new_address, :new_phone, :reference, :new_note, :resources, tag_list: [])
    clean_params.merge!({current_user_id: current_user.id}) unless current_user.nil?
  end

  def load_less_active_members
    @less_active_members = LessActiveMemberDecorator.decorate_collection(LessActiveMember.order('surname, given_name asc'))
    #@less_active_members = LessActiveMemberDecorator.decorate_collection(LessActiveMember.no_current_address.order('surname, given_name asc'))
    @less_active_members_total_cnt = LessActiveMember.count
  end

  def import_names_params
    params.require(:less_active_member).permit(:names)
  end
end
