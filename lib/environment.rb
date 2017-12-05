# class ConstClass
#         #http://stagingrc.cloudfactory.com/signin
#        #http://stagingrc.worker.cloudfactory.com
#        	UrlCP =  http://cloudfactory.di/users/sign_in
#       	UrlWP = http://worker.cloudfactory.di/worker_login

#        def returnConstant
# 					UrlCP
# 					UrlWP 
#        end
#  end



ENV['UrlCP'] = 'http://cloudfactory.di/users/sign_in'
ENV['user_id_CP'] = 'admin@cloudfactory.com'
ENV['password_pass_CP'] = 'automation'

ENV['UrlWP'] = 'http://worker.cloudfactory.di/worker_login'
ENV['user_id_WP'] = 'admin@cloudfactory.com'
ENV['password_pass_WP'] = 'automation'