class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image,
  :storage => :dropbox,
    :dropbox_credentials => { app_key: ENV['APP_KEY'],
                              app_secret: ENV['APP_SECRET'],
                              access_token: ENV['ACCESS_TOKEN'],
                              access_token_secret: ENV['ACCESS_TOKEN_SECRET'],
                              user_id: ENV['USER_ID'],
                              access_type: 'app_folder'}

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  LOCATION = [ 
    "Ashville, NC",
    "Atlanta, GA",
    "Austin, TX",
    "Charleston, SC",
    "Columbia, SC",
    "Durham, NC",
    "Greenville, SC",
    "Houston, TX",
    "Spartanburg, SC",
    "Tampa, FL"
  ]

  COURSE = [ 
    "iOS Engineering",
    "Rails Engineering",
    "Front End Engineering"
  ]
end
