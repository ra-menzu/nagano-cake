class Admin::Guest < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         acts_as_paranoid
         after_destroy      :update_document_in_search_engine
  		 after_restore      :update_document_in_search_engine
  		 after_real_destroy :remove_document_from_search_engine
end
