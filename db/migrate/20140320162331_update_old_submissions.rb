class UpdateOldSubmissions < ActiveRecord::Migration
  def change
    Submission.where(month: ['june','july','august','september','october','november']).update_all(year: 2013)
    Submission.where(month: ['january','february','march']).update_all(year: 2014)
  end
end
