# frozen_string_literal: true

Rails.logger.error '[BASE START UP]'
Rails.logger.error "SIDEKIQ_DB_POOL: #{ENV.fetch('SIDEKIQ_DB_POOL', nil)}"
