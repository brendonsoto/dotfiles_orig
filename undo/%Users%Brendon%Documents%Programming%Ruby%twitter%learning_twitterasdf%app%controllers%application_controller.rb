Vim�UnDo� vC���D��ӈ�d�N�խi����.�K0m´�      N    $twitter.search("valhalla", result_type: "recent").take(3).each do |tweet|            :       :   :   :    T�b�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             T�EG     �                 �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             T�E[    �      	   	          �             5�_�                       /    ����                                                                                                                                                                                                                                                                                                                                                             T�F�    �      
               �      
   
    5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                             T�H�    �   
          5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             T�H�    �      	         0      "#{tweet.user.screen_name}: #{tweet.text}"5�_�                       >    ����                                                                                                                                                                                                                                                                                                                               E          >       v   >    T�I    �               Q    $twitter.search("valhalla", result_type: "recent").take(3).collect do |tweet|5�_�                    
       ����                                                                                                                                                                                                                                                                                                                               E          >       v   >    T�Iy    �   
              �   
          5�_�      	                 6    ����                                                                                                                                                                                                                                                                                                                               6          =       v   =    T�I�    �               I    $twitter.search("valhalla", result_type: "recent").take(3) do |tweet|5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                               6          =       v   =    T�_     �               A    $twitter.search("valhalla", result_type: "recent") do |tweet|5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                            	                    v       T�_(     �      
              end�      	          =      render text: "#{tweet.user.screen_name}: #{tweet.text}"5�_�   
                    @    ����                                                                                                                                                                                                                                                                                                                               @                  v        T�_2     �               J    tweets = $twitter.search("valhalla", result_type: "recent") do |tweet|5�_�                       ?    ����                                                                                                                                                                                                                                                                                                                               @                  v        T�_8     �               K    tweets = $twitter.search("valhalla", result_type: "recent") #do |tweet|5�_�                    	       ����                                                                                                                                                                                                                                                                                                                               @                  v        T�_>     �   	                �   	          5�_�                           ����                                                                                                                                                                                                                                                                                                                               @                  v        T�_P    �                     �             5�_�                       ?    ����                                                                                                                                                                                                                                                                                                                               F          ?       v   ?    T�_z     �               S    tweets = $twitter.search("valhalla", result_type: "recent").take(3) #do |tweet|5�_�                    
       ����                                                                                                                                                                                                                                                                                                                               F          ?       v   ?    T�_|     �   	   
              tweets.each do |tweet|5�_�                           ����                                                                                                                                                                                                                                                                                                                               F          ?       v   ?    T�_}     �   
                 end5�_�                    
       ����                                                                                                                                                                                                                                                                                                                               F          ?       v   ?    T�_}     �   	   
                render text: tweet.text5�_�                   
       ����                                                                                                                                                                                                                                                                                                                               F          ?       v   ?    T�_   	 �   	                �   	          5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       T�_�     �      	          ?    #   render text: "#{tweet.user.screen_name}: #{tweet.text}"5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�_�     �      
          	    # end5�_�                          ����                                                                                                                                                                                                                                                                                                                                                V       T�`!     �      	          =      render text: "#{tweet.user.screen_name}: #{tweet.text}"5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�`"     �      
              end5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�`#     �   	                �   	          5�_�                     
       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�`*     �   	   
              tweets.join(5�_�      !               
       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�`,   
 �   	                render text: tweets.first5�_�       "           !   
       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�`�    �   	            !    render text: tweets.join(" ")5�_�   !   #           "   
       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�a     �   	   
              render text: tweets.class5�_�   "   $           #   	       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�a	     �      
          	    # end5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                                                V       T�a
     �      	          ?      # render text: "#{tweet.user.screen_name}: #{tweet.text}"5�_�   $   &           %      @    ����                                                                                                                                                                                                                                                                                                                                                V       T�a     �               K    tweets = $twitter.search("valhalla", result_type: "recent") #do |tweet|5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                                v       T�a    �      	         =      render text: "#{tweet.user.screen_name}: #{tweet.text}"5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                v       T�a    �               J    tweets = $twitter.search("valhalla", result_type: "recent") do |tweet|5�_�   '   )           (      6    ����                                                                                                                                                                                                                                                                                                                                                v       T�a/    �               A    $twitter.search("valhalla", result_type: "recent") do |tweet|5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                v       T�a?    �      	         5      puts "#{tweet.user.screen_name}: #{tweet.text}"5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                            	                    v       T�a�     �      
              end�      	          =      render text: "#{tweet.user.screen_name}: #{tweet.text}"�                N    $twitter.search("valhalla", result_type: "recent").take(3).each do |tweet|5�_�   *   ,           +   	       ����                                                                                                                                                                                                                                                                                                                            	                    v       T�a�     �   	          5�_�   +   -           ,   
       ����                                                                                                                                                                                                                                                                                                                            	                    v       T�a�     �   	                5�_�   ,   .           -   
       ����                                                                                                                                                                                                                                                                                                                            	                    v       T�a�    �   	            +    $twitter.user_timeline("brendon_soto_")5�_�   -   /           .   
       ����                                                                                                                                                                                                                                                                                                                            
          
          v       T�b@    �   	            8    render text: $twitter.user_timeline("brendon_soto_")5�_�   .   0           /   
   '    ����                                                                                                                                                                                                                                                                                                                            
   '       
   7       v   7    T�bE    �   	            8    render text: $twitter.home_timeline("brendon_soto_")5�_�   /   1           0   
       ����                                                                                                                                                                                                                                                                                                                            
          
          V       T�bj     �   	             '    render text: $twitter.home_timeline5�_�   0   2           1   
   &    ����                                                                                                                                                                                                                                                                                                                            
          
          V       T�bk     �   
                �   
          5�_�   1   3           2          ����                                                                                                                                                                                                                                                                                                                            
          
          V       T�b�     �   
             C    render text: $twitter.search("valhalla", result_type: "recent")5�_�   2   4           3          ����                                                                                                                                                                                                                                                                                                                                                v       T�b�     �      	         ?    #   render text: "#{tweet.user.screen_name}: #{tweet.text}"5�_�   3   5           4   	       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�b�     �      
          	    # end5�_�   4   6           5          ����                                                                                                                                                                                                                                                                                                                                                V       T�b�     �      	          3    #    "#{tweet.user.screen_name}: #{tweet.text}"5�_�   5   7           6          ����                                                                                                                                                                                                                                                                                                                                                V       T�b�     �                P    # $twitter.search("valhalla", result_type: "recent").take(3).each do |tweet|5�_�   6   8           7          ����                                                                                                                                                                                                                                                                                                                                                V       T�b�    �               N    $twitter.search("valhalla", result_type: "recent").take(3).each do |tweet|5�_�   7   9           8          ����                                                                                                                                                                                                                                                                                                                                                V       T�b�     �      	          1       "#{tweet.user.screen_name}: #{tweet.text}"5�_�   8   :           9   	       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�b�     �      
              end5�_�   9               :      C    ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�b�    �               [    render text: $twitter.search("valhalla", result_type: "recent").take(3).each do |tweet|5�_�                     @    ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�`     �               J    tweets = $twitter.search("valhalla", result_type: "recent") do |tweet|5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�`     �   	           5�_�                           ����                                                                                                                                                                                                                                                                                                                            
          
          V       T�`     �                     �      	               5�_�                            ����                                                                                                                                                                                                                                                                                                                            	          	          V       T�`     �      	        5�_�                           ����                                                                                                                                                                                                                                                                                                                            
          
          V       T�`     �                   �      	             tw5�_�                    
       ����                                                                                                                                                                                                                                                                                                                               F          ?       v   ?    T�_~     �   
             5��