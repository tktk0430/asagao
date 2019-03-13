# frozen_string_literal: true

class Member < ApplicationRecord
  has_secure_password

  validates :number, presence: true,
    numericality:{
      only_integer: true,
      greater_than: 0,
      less_than: 100,
      allow_blank: true,
    },
    uniqueness: true

  validates :name, presence: true,
    format: {with: /\A[A-Za-z][A-Za-z0-9]*\z/, allow_blank: true},
    length: {minimum: 2, maximum: 20, allow_blank: true},
    uniqueness: {case_sensitive: false}
  
  validates :full_name, length:{maximum: 20}
  validates :email, email: {allow_blank: true}

  class << self
    def search(query) # queryの文字をname or full_nameに検索をかけて昇順にしたものをインスタンスに返す
      rel = order('number')
      if query.present?
        rel = rel.where('name LIKE ? OR full_name LIKE ?', "%#{query}%", "%#{query}%")
      end
      rel # リレーションオブジェクトをMemberに返す
    end
  end
end
