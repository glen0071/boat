class CreateMnDocData < ActiveRecord::Migration[7.0]
  def change
    create_table :mn_doc_data do |t|

      # basics
      t.date :publish_date
      t.integer :total

      # gender
      t.integer :females
      t.integer :male

      # offenses
      t.integer :criminal_sexual_conduct
      t.integer :homicide
      t.integer :drugs_offense
      t.integer :weapons_offense
      t.integer :assault
      t.integer :assault_domestic

      # type of offenses
      t.integer :person
      t.integer :drugs_type_offense
      t.integer :weapons_type_offense
      t.integer :property
      t.integer :other_type_offense
      t.integer :dwi
      t.integer :psi_holds
      
      # meta
      t.integer :number_of_lifers
      t.integer :average_age
      t.integer :current_inmates_over_fifty
      t.integer :current_inmates_under_eighteen
      t.integer :average_population
      t.integer :certified_as_adults
      t.integer :inmates_employed
      
      # race
      t.integer :white
      t.integer :black
      t.integer :american_indian
      t.integer :asian
      t.integer :unknown_other
      t.integer :hispanic
      
      # education
      t.integer :grades_0_8
      t.integer :grades_9_11
      t.integer :high_school
      t.integer :ged
      t.integer :college
      t.integer :other_unknown_edu

      # marital status
      t.integer :single
      t.integer :married
      t.integer :divorced_separated
      t.integer :other_unknown_marital
      
      # religion
      t.integer :unknown_no_preference
      t.integer :other_christian
      t.integer :other_religions
      t.integer :catholic
      t.integer :muslim
      t.integer :native_american_religions
      t.integer :lutheran
      t.integer :baptist
      
      # county of commitment
      t.integer :hennepin
      t.integer :ramsey
      t.integer :st_louis
      t.integer :stearns
      t.integer :dakota
      t.integer :faribault
      t.integer :stillwater
      t.integer :moose_lake
      t.integer :lino_lakes
      t.integer :rush_city
      t.integer :st_cloud
      t.integer :shakopee
      t.integer :oak_park_heights
      t.integer :willow_river
      t.integer :togo
      t.integer :red_wing
      t.integer :work_release
      t.integer :county_jail_federal_prison
      t.integer :institution_community_work_crews
      t.integer :non_doc_correctional_facility
      
      # admissions
      t.integer :new_commitments
      t.integer :release_return_no_new_sentence
      t.integer :release_return_new_sentence

      # commitments
      t.integer :january_june
      t.integer :july_december

      # releases
      t.integer :supervised_release_parole
      t.integer :community_programs
      t.integer :discharge
      t.integer :work_release_covod
      t.integer :other_release

      t.timestamps
    end
  end
end
