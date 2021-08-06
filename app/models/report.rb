class Report < ApplicationRecord
    has_many :elements, inverse_of: :report, :dependent => :destroy
    accepts_nested_attributes_for :elements, allow_destroy: true 

    default_scope -> {order('course asc, level asc, unit asc, classroom asc')}
end
