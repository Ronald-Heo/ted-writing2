class BulletinController < ApplicationController
    before_action :authenticate_user!, except: [:article] 
    
    def article
        @posts = Post.all
        @user = User.all
    end
    
    def mailing
        
    end
    
    def email_sender
        s3 = AWS::S3.new
        obj = s3.buckets['bulletin-article'].objects['key']
        title=params[:title]
        content=params[:content]
        receiver=params[:receiver]
        cc=params[:cc]
        Call.welcome_email(receiver, cc, title, content).deliver_now
        redirect_to '/'
    end
    
    
    
    def write
        post = Post.new
        post.content = params[:content]
        post.min = params[:min]
        post.user_name = params[:user_name]
        post.title = params[:title]
                
        post.save
        redirect_to '/bulletin/params[:title]'
        
    end
    
    
    
    def delete
        post = Post.new
        @post = Post.find(params[:id])
        post.title = params[:title]
        @post.destroy
            redirect_to '/bulletin/params[:title]'
                
    end
    
    
    
    def update
        @post = Post.find(params[:id])
        @get_psw = params[:new_passwd]
        @post.content = params[:new_content]
        if (@post.password == @get_psw)
            @post.save
            redirect_to '/bulletin/read'

        else
            @error = "비밀번호가 틀립니다."
            
        end
        
    end
    
    
    
    def modify
        
        
    end
    
    def read
       @user = User.all
    end
    
    def write_reply
       my_reply = Reply.new
       my_reply.post_id = params[:my_post_my_id]
       my_reply.content = params[:myreply]
       @post_id = myreply.post_id
       
                  my_reply.save
       redirect_to "/bulletin/read"
    end
    
    def tim_ferriss
                @post = Post.all

          uri = URI("http://www.ted.com/talks/tim_ferriss_smash_fear_learn_anything/transcript?language=ko")
        @html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
        @parsing_p = @html_doc.css('div.talk-article__body > p')
        @parsing_t = @html_doc.css('div.talk-article__body > p')
        @content = Array.new
        @time = Array.new
        @parsing_p.each do |text|
            @content.push(text.css('span.talk-transcript__para__text').inner_text)
        end
        @parsing_t.each do |time|
            @time.push(time.css('data').inner_text)
        end
        
          urie = URI("http://www.ted.com/talks/tim_ferriss_smash_fear_learn_anything/transcript?language=en")
        @html_doce = Nokogiri::HTML(Net::HTTP.get(urie))
        @parsing_pe = @html_doce.css('div.talk-article__body > p')
        @parsing_te = @html_doce.css('div.talk-article__body > p')
        @contente = Array.new
        @timee = Array.new
        @parsing_pe.each do |text|
            @contente.push(text.css('span.talk-transcript__para__text').inner_text)
        end
        @parsing_te.each do |time|
            @timee.push(time.css('data').inner_text)
        end
    end
    
    def susan_cain
                @post = Post.all

        uri = URI("http://www.ted.com/talks/susan_cain_the_power_of_introverts/transcript?language=ko")
        @html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
        @parsing_p = @html_doc.css('div.talk-article__body > p')
        @parsing_t = @html_doc.css('div.talk-article__body > p')
        @content = Array.new
        @time = Array.new
        @parsing_p.each do |text|
            @content.push(text.css('span.talk-transcript__para__text').inner_text)
        end
        @parsing_t.each do |time|
            @time.push(time.css('data').inner_text)
        end
        
         urie = URI("http://www.ted.com/talks/susan_cain_the_power_of_introverts/transcript?language=en")
        @html_doce = Nokogiri::HTML(Net::HTTP.get(urie))
        @parsing_pe = @html_doce.css('div.talk-article__body > p')
        @parsing_te = @html_doce.css('div.talk-article__body > p')
        @contente = Array.new
        @timee = Array.new
        @parsing_pe.each do |text|
            @contente.push(text.css('span.talk-transcript__para__text').inner_text)
        end
        @parsing_te.each do |time|
            @timee.push(time.css('data').inner_text)
        end
     
    end
    
    def ken_robinson
                @post = Post.all

         uri = URI("http://www.ted.com/talks/ken_robinson_says_schools_kill_creativity/transcript?language=ko")
        @html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
        @parsing_p = @html_doc.css('div.talk-article__body > p')
        @parsing_t = @html_doc.css('div.talk-article__body > p')
        @content = Array.new
        @time = Array.new
        @parsing_p.each do |text|
            @content.push(text.css('span.talk-transcript__para__text').inner_text)
        end
        @parsing_t.each do |time|
            @time.push(time.css('data').inner_text)
        end
       
        urie = URI("http://www.ted.com/talks/ken_robinson_says_schools_kill_creativity/transcript?language=en")
        @html_doce = Nokogiri::HTML(Net::HTTP.get(urie))
        @parsing_pe = @html_doce.css('div.talk-article__body > p')
        @parsing_te = @html_doce.css('div.talk-article__body > p')
        @contente = Array.new
        @timee = Array.new
        @parsing_pe.each do |text|
            @contente.push(text.css('span.talk-transcript__para__text').inner_text)
        end
        @parsing_te.each do |time|
            @timee.push(time.css('data').inner_text)
        end
    end
end
