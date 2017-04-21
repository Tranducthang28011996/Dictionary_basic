class ArticlesController < ApplicationController
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
  def index
  end
  
  def getdata
  	@value = params[:search].downcase	
   	if @value == nil
  		
  	else
	  	link_page_soha="http://tratu.soha.vn/dict/en_vn/"
	  	get_link_soha = link_page_soha + params[:search].downcase
		page = Nokogiri::HTML(open(get_link_soha))
		soha = Array.new
		soha = page.css("div#content-5 h5")
		@load2 = soha
		# byebug
		uri = URI("https://www.google.co.kr/search?q="+params[:search]+"&es_sm=93&source=lnms&tbm=isch&sa=X&ved=0CAcQ_AUoAWoVChMIxs2HlMH4xwIVouWmCh1nigKU&biw=1600&bih=775")
		html_doc = Nokogiri::HTML(open(uri))
		@images = html_doc.css("a > img")
		render :layout => false
	end
	
  end
end