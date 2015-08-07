class Call < ApplicationMailer
    
    def welcome_email gg_1_receiver, cc_1, gg_1_title, gg_2_content  
        mail from: 'torins@naver.com',
               to: gg_1_receiver, 
               cc: cc_1,
          subject: gg_1_title,
             body: gg_2_content #내용
       attachment: @   
        
    end
    
   
end
