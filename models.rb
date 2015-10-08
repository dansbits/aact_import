class Authority < Sequel::Model
  unrestrict_primary_key
end

class ClinicalStudy < Sequel::Model

  unrestrict_primary_key

  set_dataset :clinical_study

end

class CentralContact < Sequel::Model
  unrestrict_primary_key
end

class Condition < Sequel::Model
  unrestrict_primary_key
end

class Design < Sequel::Model
  unrestrict_primary_key
end

class Facility < Sequel::Model
  unrestrict_primary_key
end

class FacilityContact < Sequel::Model
  unrestrict_primary_key
end

class Intervention < Sequel::Model
  unrestrict_primary_key
end

class InterventionOtherName < Sequel::Model
  unrestrict_primary_key
end

class InterventionArmGroup < Sequel::Model
  unrestrict_primary_key
end

class Investigator < Sequel::Model
  unrestrict_primary_key
end

class Keyword < Sequel::Model
  unrestrict_primary_key
end

class Link < Sequel::Model
  unrestrict_primary_key
end

class LocationCountry < Sequel::Model
  unrestrict_primary_key
end

class NctAlias < Sequel::Model
  unrestrict_primary_key
end

class OverallOfficial < Sequel::Model
  unrestrict_primary_key
end

class Reference < Sequel::Model
  unrestrict_primary_key
end

class RemovedCountry < Sequel::Model
  unrestrict_primary_key
end

class ResponsibleParty < Sequel::Model
  unrestrict_primary_key
end

class SecondaryId < Sequel::Model
  unrestrict_primary_key
end

class Sponsor < Sequel::Model
  unrestrict_primary_key
end
