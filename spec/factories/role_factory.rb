Factory.define :role do |role|

end

Factory.define :admin_role, :parent => :role do |r|
  r.name {'admin'}
end

Factory.define :trainer_role, :parent => :role do |r|
  r.name {'trainer'}
end

Factory.define :user_role, :parent => :role do |r|
  r.name {'user'}
end

