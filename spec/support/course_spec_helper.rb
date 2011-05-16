#encoding: utf-8

module CourseSpecHelper
  def setup_courses
    @software_estimates = Factory(:course, {:course_name => '软件估算',
                                            :status => 'open',
                                            :duration_in_hours => 4,
    })

    @it_office_guideline = Factory(:course, {:course_name => 'IT职场指南', :status => 'open'})

    @tdd = Factory(:course, {:course_name => '测试驱动开发', :status => 'open'})

    @dos = Factory(:course, {:course_name => 'DOS', :status => 'closed'})
  end

  def setup_catalogs
    @project_management = Factory(:catalog, {:name => "项目管理",
                                             :enabled => true})
    @programming = Factory(:catalog, {:name => "编程",
                                      :enabled => true})
  end

  def setup_trainers
    @edward = Factory(:user, {:username => "edwardzhou",
                              :email => "edward.zhq@gmail.com",
                              :password => "123456",
                              :true_name => "周辉庆",
                              :contact_phone => "13798310591",
                              :role => 'trainer'
    })
  end

  def setup_locations
    @ru_jia_hotel = Factory(:location, {:city => "深圳市",
                                        :address => "深圳市福田区竹子林如家酒店4楼第一会议室",
                                        :zip => "518001"
    })
  end

  def setup_campaigns
    Factory(:campaign, {:name => '软件估算 - 福田班第一期',
                        :status => 'closed',
                        :start_date => Date.parse('2011-05-01'),
                        :end_date => Date.parse('2011-05-01'),
                        :register_due_date => Date.parse('2011-04-25'),
                        :course => @software_estimates,
                        :trainer => @edward,
                        :price => 380,
                        :discount_price => 280,
                        :training_room => @ru_jia_hotel
    })

    Factory(:campaign, {:name => '软件估算 - 福田班第二期',
                        :status => 'open',
                        :start_date => Date.parse('2011-06-01'),
                        :end_date => Date.parse('2011-06-01'),
                        :register_due_date => Date.parse('2011-05-25'),
                        :course => @software_estimates,
                        :trainer => @edward,
                        :price => 380,
                        :discount_price => 280,
                        :training_room => @ru_jia_hotel
    })

  end

end
