ActionMailer::Base.smtp_settings = {
  address:              'smtp.mandrillapp.com',
  port:                 587,
  user_name:            'ssharm17@ncsu.edu',
  password:             '_4s2f0QlJBYq_6cCQWQ-og',
  authentication:       'plain',
  enable_starttls_auto: true  }

ActionMailer::Base.delivery_method = :smtp
