class Element < ApplicationRecord

  belongs_to :report, inverse_of: :elements

  default_scope -> {order('id asc')}

end
