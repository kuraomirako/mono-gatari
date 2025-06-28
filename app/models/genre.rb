class Genre < ActiveHash::Base
 self.data = [
   { id: 1, name: '---' },
   { id: 2, name: '日常' },
   { id: 3, name: '人間関係' },
   { id: 4, name: '仕事勉強' },
   { id: 5, name: 'ファンタジー' },
   { id: 6, name: '旅' },
   { id: 7, name: 'SF' },
 ]

  include ActiveHash::Associations
  has_many :stories

end