class Department < ActiveHash::Base
  self.data = [
    {id: 1, name: '選択してください'},
    {id: 2, name: '青果'},
    {id: 3, name: '精肉'},
    {id: 4, name: '鮮魚'},
    {id: 5, name: '加工食品'},
    {id: 6, name: '惣菜'},
    {id: 7, name: 'ベーカリー'},
    {id: 8, name: 'その他'}
  ]
end
