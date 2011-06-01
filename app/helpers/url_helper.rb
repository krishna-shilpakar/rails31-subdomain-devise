module UrlHelper
  def with_account(account)
    
    account = (account || "")
    account += "." unless account.empty?
    [account, request.domain].join
  end

  def url_for(options = nil)
    if options.kind_of?(Hash) && options.has_key?(:account)
      options[:host] = with_account(options.delete(:account))
    end
    super
  end
  def set_mailer_url_options
    ActionMailer::Base.default_url_options[:host] = with_account(request.subdomains.first)
  end
end
