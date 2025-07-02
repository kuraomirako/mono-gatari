class Genre < ActiveHash::Base
 self.data = [
   { id: 1, name: '---' },
   { id: 2, name: '日常' },
   { id: 3, name: '人間関係' },
   { id: 4, name: '仕事勉強' },
   { id: 5, name: 'ファンタジー' },
   { id: 6, name: 'SF' },
   { id: 7, name: '恋愛' },
 ]

  include ActiveHash::Associations
  has_many :stories

end