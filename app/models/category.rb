class Category < ActiveHash::Base
  self.data = [
    {id: 0, name: '---'},
    {id: 1, name: '海水'},
    {id: 2, name: '淡水'},
    {id: 3, name: 'ビオトープ'}
  ]
  include ActiveHash::Associations
  has_many :aquas
end
