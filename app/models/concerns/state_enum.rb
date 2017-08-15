module StateEnum
  extend ActiveSupport::Concern

  included do
    enum state: {"Andaman and Nicobar Islands"=>0, "Andra Pradesh"=>1, "Arunachal Pradesh"=>2, "Assam"=>3, "Bihar"=>4, "Chandigarh"=>5, "Chhattisgarh"=>6, "Dadar and Nagar Haveli"=>7, "Daman and Diu"=>8, "Delhi"=>9, "Goa"=>10, "Gujarat"=>11, "Haryana"=>12, "Himachal Pradesh"=>13, "Jammu and Kashmir"=>14, "Jharkhand"=>15, "Karnataka"=>16, "Kerala"=>17, "Lakshadeep"=>18, "Madya Pradesh"=>19, "Maharashtra"=>20, "Manipur"=>21, "Meghalaya"=>22, "Mizoram"=>23, "Nagaland"=>24, "Orissa"=>25, "Pondicherry"=>26, "Punjab"=>27, "Rajasthan"=>28, "Sikkim"=>29, "Tamil Nadu"=>30, "Tripura"=>31, "Uttar Pradesh"=>32, "Uttaranchal"=>33, "West Bengal"=>34}
  end
end