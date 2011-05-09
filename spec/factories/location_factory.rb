#encoding: utf-8

Factory.define :location do |location|
  location.city { "深圳市" }
  location.address { "福田区" }
  location.zip { "518001" }
end