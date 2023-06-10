class MnDataController < ApplicationController
  def index
    @mn_doc_data = MnDocData.new
  end

  def edit
    @mn_doc_data = MnDocData.find(params[:id])
  end

  def update
    mn_doc_data = MnDocData.find(params[:id])
    mn_doc_data.update(mn_data_params)

    redirect_to mn_data_url
  end

  def create
    new_data = MnDocData.new(mn_data_params)

    if new_data.save
      redirect_to new_mn_datum_url, notice: 'Data saved'
    else
      render :edit
    end
  end
  
  def new
    @mn_doc_data = MnDocData.new
  end
  
  def index
    @mn_doc_data = MnDocData.all
  end
  
  def upload
    # PDF::Reader.new(params[:mn_doc_data][:file].tempfile)
    # binding.pry
  end

  def mn_data_params
    params
      .require(:mn_doc_data)
      .permit(
        :publish_date, :total,
        :female, :male,
        :criminal_sexual_conduct,
        :homicide,
        :drugs_offense,
        :weapons_offense,
        :assault,
        :assault_domestic,
        :burglary,
        :larceny,
        :robbery,

        :person,
        :drugs_type_offense,
        :weapons_type_offense,
        :property,
        :other_type_offense,
        :dwi,
        :psi_holds,

        :number_of_lifers,
        :average_age,
        :current_inmates_over_fifty,
        :current_inmates_under_eighteen,
        :average_population,
        :certified_as_adults,
        :inmates_employed,

        :white,
        :black,
        :american_indian,
        :asian,
        :unknown_other,
        :hispanic,
        
        :grades_0_8,
        :grades_9_11,
        :high_school,
        :ged,
        :college,
        :other_unknown_edu,

        :single,
        :married,
        :divorced_separated,
        :other_unknown_marital,
        
        :unknown_no_preference,
        :other_christian,
        :other_religions,
        :catholic,
        :jewish,
        :muslim,
        :native_american_religions,
        :lutheran,
        :baptist,
        
        :hennepin,
        :ramsey,
        :st_louis,
        :stearns,
        :dakota,
        :anoka,
        :washington,
        :faribault,
        :stillwater,
        :moose_lake,
        :lino_lakes,
        :rush_city,
        :st_cloud,
        :shakopee,
        :oak_park_heights,
        :willow_river,
        :togo,
        :red_wing,
        :work_release,
        :county_jail_federal_prison,
        :institution_community_work_crews,
        :non_doc_correctional_facility,
        
        :new_commitments,
        :release_return_no_new_sentence,
        :release_return_new_sentence,
        :total_admissions,

        :january_june,
        :july_december,

        :supervised_release_parole,
        :total_releases,
        :community_programs,
        :discharge,
        :work_release_covod,
        :other_release
      )
  end
end
