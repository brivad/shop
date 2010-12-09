class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  # def current_cart
  #   session[:cart_id] ||= Cart.create!.id
  #   @current_cart ||= Cart.find_or_create_by_id(session[:cart_id])
  # end
  
  def current_cart  
    if session[:cart_id]  
      @current_cart ||= Cart.find(session[:cart_id])  
      if @current_cart.purchased_at
        session[:cart_id] = nil  
        session[:shipping_price] = nil
      end 
    end  

    if session[:cart_id].nil?  
      @current_cart = Cart.create!  
      session[:cart_id] ||= @current_cart.id  
    end  
    @current_cart  
  end
  
  def calculate_shipping              #TODO: refactor from scratch
    sgc = shipping_group_count
    stc =  sgc.values.sum             #shipping total items count

    if $COUNTRIES[:z1].include? current_cart.country
      if sgc[:g1] == 1 && stc == 1      #in total 1 product in group 1
        session[:shipping_price] = "5"
      elsif sgc[:g1] == 2 && stc == 2   #in tatal 2 products in group 1
        session[:shipping_price] = "6"
      else
        session[:shipping_price] = "8"
      end
    end
    
    if $COUNTRIES[:z2].include? current_cart.country
      if sgc[:g1] == 1 && stc == 1      #in total 1 product in group 1
        session[:shipping_price] = "10"
      elsif sgc[:g1] == 2 && stc == 2   #in tatal 2 products in group 1
        session[:shipping_price] = "11"
      else
        session[:shipping_price] = "20"
      end
    end
    
    if $COUNTRIES[:z3].include? current_cart.country
      if sgc[:g1] == 1 && stc == 1      #in total 1 product in group 1
        session[:shipping_price] = "12"
      elsif sgc[:g1] == 2 && stc == 2   #in tatal 2 products in group 1
        session[:shipping_price] = "14"
      else
        session[:shipping_price] = "30"
      end
    end
    
    if $COUNTRIES[:z4].include? current_cart.country
      if sgc[:g1] == 1 && stc == 1      #in total 1 product in group 1
        session[:shipping_price] = "13"
      elsif sgc[:g1] == 2 && stc == 2   #in tatal 2 products in group 1
        session[:shipping_price] = "17"
      else
        session[:shipping_price] = "35"
      end
    end
    
  end
  
  
  def shipping_group_count
    h={:g1=>0,
       :g2=>0,
       :g3=>0}
    current_cart.line_items.each do |item|
      group = "g" + item.product.shipping_group.to_s
      qty = item.quantity
      h[group.to_sym] += qty
    end
    h
  end
  
  $COUNTRIES = {        #TODO: move in config file
    :z1 => ["Italy"],
    :z2 => ["Albania",
            "Algeria",
            "Andorra",
            "Austria",
            "Belarus",
            "Belgium",
            "Bosnia and Herzegowina",
            "Bulgaria",
            "Croatia",
            "Cyprus",
            "Czech Republic",
            "Denmark",
            "Egypt",
            "Estonia",
            "Finland",
            "France",
            "Germany",
            "Gibraltar",
            "United Kingdom",
            "Greece",
            "Hungary",
            "Iceland",
            "Ireland",
            "Israel",
            "Jordan",
            "Latvia",
            "Lebanon",
            "Libyan Arab Jamahiriya",
            "Liechtenstein",
            "Lithuania",
            "Luxembourg",
            "Macedonia, The Former Yugoslav Republic Of",
            "Malta",
            "Morocco",
            "Moldova, Republic of",
            "Monaco",
            "Montenegro",
            "Netherlands",
            "Norway",
            "Poland",
            "Portugal",
            "Romania",
            "Russian Federation",
            "San Marino",
            "Slovakia",
            "Slovenia",
            "Spain",
            "Sweden",
            "Switzerland",
            "Syrian Arab Republic",
            "Tunisia",
            "Turkey",
            "Ukraine"],
    :z3 => ["Afghanistan",
            "Aland Islands",
            "American Samoa",
            "Angola",
            "Anguilla",
            "Antarctica",
            "Antigua And Barbuda",
            "Argentina",
            "Armenia",
            "Aruba",
            "Azerbaijan",
            "Bahamas",
            "Bahrain",
            "Bangladesh",
            "Barbados",
            "Belize",
            "Benin",
            "Bermuda",
            "Bhutan",
            "Bolivia",
            "Botswana",
            "Bouvet Island",
            "Brazil",
            "British Indian Ocean Territory",
            "Brunei Darussalam",
            "Burkina Faso",
            "Burundi",
            "Cambodia",
            "Cameroon",
            "Canada",
            "Cape Verde",
            "Cayman Islands",
            "Central African Republic",
            "Chad",
            "Chile",
            "China",
            "Christmas Island",
            "Cocos (Keeling) Islands",
            "Colombia",
            "Comoros",
            "Congo",
            "Congo, the Democratic Republic of the",
            "Cook Islands",
            "Costa Rica",
            "Cote d'Ivoire",
            "Cuba",
            "Djibouti",
            "Dominica",
            "Dominican Republic",
            "Ecuador",
            "El Salvador",
            "Equatorial Guinea",
            "Eritrea",
            "Ethiopia",
            "Falkland Islands (Malvinas)",
            "Faroe Islands",
            "Fiji",
            "French Guiana",
            "French Polynesia",
            "French Southern Territories",
            "Gabon",
            "Gambia",
            "Georgia",
            "Ghana",
            "Greenland",
            "Grenada",
            "Guadeloupe",
            "Guam",
            "Guatemala",
            "Guernsey",
            "Guinea",
            "Guinea-Bissau",
            "Guyana",
            "Haiti",
            "Heard and McDonald Islands",
            "Holy See (Vatican City State)",
            "Honduras",
            "Hong Kong",
            "India",
            "Indonesia",
            "Iran, Islamic Republic of",
            "Iraq",
            "Isle of Man",
            "Jamaica",
            "Japan",
            "Jersey",
            "Kazakhstan",
            "Kenya",
            "Kiribati",
            "Korea, Democratic People's Republic of",
            "Korea, Republic of",
            "Kuwait",
            "Kyrgyzstan",
            "Lao People's Democratic Republic",
            "Libyan Arab Jamahiriya",
            "Macao",
            "Madagascar",
            "Malawi",
            "Malaysia",
            "Maldives",
            "Mali",
            "Marshall Islands",
            "Martinique",
            "Mauritania",
            "Mauritius",
            "Mayotte",
            "Mexico",
            "Micronesia, Federated States of",
            "Mongolia",
            "Montserrat",
            "Morocco",
            "Mozambique",
            "Myanmar",
            "Namibia",
            "Nauru",
            "Nepal",
            "Netherlands Antilles",
            "New Caledonia",
            "Nicaragua",
            "Niger",
            "Nigeria",
            "Niue",
            "Norfolk Island",
            "Northern Mariana Islands",
            "Oman",
            "Pakistan",
            "Palau",
            "Palestinian Territory, Occupied",
            "Panama",
            "Papua New Guinea",
            "Paraguay",
            "Peru",
            "Philippines",
            "Pitcairn",
            "Puerto Rico",
            "Qatar",
            "Reunion",
            "Rwanda",
            "Saint Barthelemy",
            "Saint Helena",
            "Saint Kitts and Nevis",
            "Saint Lucia",
            "Saint Pierre and Miquelon",
            "Saint Vincent and the Grenadines",
            "Samoa",
            "Sao Tome and Principe",
            "Saudi Arabia",
            "Senegal",
            "Serbia",
            "Seychelles",
            "Sierra Leone",
            "Singapore",
            "Solomon Islands",
            "Somalia",
            "South Africa",
            "South Georgia and the South Sandwich Islands",
            "Sri Lanka",
            "Sudan",
            "Suriname",
            "Svalbard and Jan Mayen",
            "Swaziland",
            "Taiwan, Province of China",
            "Tajikistan",
            "Tanzania, United Republic of",
            "Thailand",
            "Timor-Leste",
            "Togo",
            "Tokelau",
            "Tonga",
            "Trinidad and Tobago",
            "Turkmenistan",
            "Turks and Caicos Islands",
            "Tuvalu",
            "Uganda",
            "United Arab Emirates",
            "United States",
            "United States Minor Outlying Islands",
            "Uruguay",
            "Uzbekistan",
            "Vanuatu",
            "Venezuela",
            "Viet Nam",
            "Virgin Islands, British",
            "Virgin Islands, U.S.",
            "Wallis and Futuna",
            "Western Sahara",
            "Yemen",
            "Zambia",
            "Zimbabwe"],
    :z4 => ["Australia",  
            "New Zealand"]
    } unless const_defined?("COUNTRIES")
  
end
