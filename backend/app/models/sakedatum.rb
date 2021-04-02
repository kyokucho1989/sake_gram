# frozen_string_literal: true

class Sakedatum < ApplicationRecord
  def annoy
    require './app/models/flavor'
    require 'annoy'

    f = 6 # length of item vector that will be indexed.
    t = Annoy::AnnoyIndex.new(n_features: f, metric: 'angular')

    Flavor.data.count.times do |i|
      @flavor = Flavor.data[i].values
      v = @flavor[1..6]
      t.add_item(i, v)
    end

    @sakeData = sakedata.split(',')
    @sakedata = @sakeData.map!(&:to_f)
    v_sake = @sakedata[0..5]

    t.add_item(9999, v_sake)
    t.build(1000)
    t.save('sake.ann')

    u = Annoy::AnnoyIndex.new(n_features: f, metric: 'angular')
    u.load('sake.ann')
    p res = u.get_nns_by_item(9999, 2)
    Flavor.data[res[1] - 1]
  end
end
