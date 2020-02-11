class Product < ApplicationRecord
	enum sales_status:{販売中: 0, 売切れ:1}
end
