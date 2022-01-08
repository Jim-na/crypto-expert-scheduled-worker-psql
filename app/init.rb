# frozen_string_literal: true

%w[domain infrastructure worker].each do |folder|
    require_relative "#{folder}/init"
  end
  