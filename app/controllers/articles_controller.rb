class ArticlesController < ApplicationController
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
  def index
  	@keyword = params[:gettext].downcase
   	if @keyword.empty?
  		@load2=[]
  	else
	  	link_page_soha="http://tratu.soha.vn/dict/en_vn/"
	  	get_link_soha = link_page_soha + params[:gettext].downcase
		page = Nokogiri::HTML(open(get_link_soha))
		soha = Array.new
		soha = page.css("div#content-3.section-h3 span")
		@load2 = soha
		@load1 = page.css("span.mw-headline b")
		# byebug
	end
	#load image from Google
	uri = URI("https://www.google.co.kr/search?q="+params[:gettext]+"&es_sm=93&source=lnms&tbm=isch&sa=X&ved=0CAcQ_AUoAWoVChMIxs2HlMH4xwIVouWmCh1nigKU&biw=1600&bih=775")
	html_doc = Nokogiri::HTML(open(uri))
	@images = html_doc.css("a > img")
  end

  def getdata
  	@keyword = params[:gettext].downcase
   	if @keyword.empty?
  		@load2=[]
  	else
	  	link_page_soha="http://tratu.soha.vn/dict/en_vn/"
	  	get_link_soha = link_page_soha + params[:gettext].downcase
		page = Nokogiri::HTML(open(get_link_soha))
		soha = Array.new
		soha = page.css("div#content-3.section-h3 span")
		@load2 = soha
		@load1 = page.css("span.mw-headline b")
		# byebug
	end
	uri = URI("https://www.google.co.kr/search?q="+params[:gettext]+"&es_sm=93&source=lnms&tbm=isch&sa=X&ved=0CAcQ_AUoAWoVChMIxs2HlMH4xwIVouWmCh1nigKU&biw=1600&bih=775")
	html_doc = Nokogiri::HTML(open(uri))
	@images = html_doc.css("a > img")
	render :layout => false
  end
end
