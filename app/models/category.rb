class Category < ActiveHash::Base
 self.data = [
   { id: 1, name: '---' },
   { id: 2, name: '実話' },
   { id: 3, name: '創作' },
 ]

  include ActiveHash::Associations
  has_many :stories

end