# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  end_date   :date             not null
#  start_date :date             not null
#  status     :string           default("PENDING"), not null
#  cat_id     :integer          not null
#
# Indexes
#
#  index_cat_rental_requests_on_cat_id  (cat_id)
#
class CatRentalRequest < ApplicationRecord
    validates :status,:start_date,:end_date,presence: true
    validates :status,inclusion: ['APPROVED','DENIED','PENDING']
    validate :does_not_overlap_approved_request

    belongs_to :cat  

    def approve!
        CatRentalRequest.transaction do
            self.status = 'APPROVED'
            save 
            overlapping_pending_requests.each do |request| 
                request.status = 'DENIED'
                request.save
            end
        end 
    end

     def deny!
       CatRentalRequest.transaction do
            self.status = 'DENIED'
            save
       end
    end

    def overlapping_requests
        # CatRentalRequest.
        # where(cat_id: cat_id).
        # where(start_date: start_date..end_date).
        # where.not(id: id).
        # or(CatRentalRequest.
        # where(cat_id: cat_id).
        # where(end_date: start_date..end_date).
        # where.not(id: id)).
        # or(CatRentalRequest.
        # where(cat_id: cat_id).
        # where('cat_rental_requests.start_date < ? AND cat_rental_requests.end_date > ?',start_date,end_date).
        # where.not(id: id))  

        CatRentalRequest.
        where(cat_id: cat_id).
        where.not(id:id).
        where.not("cat_rental_requests.start_date > ? OR cat_rental_requests.end_date < ?",end_date,start_date)
    end

    def overlapping_pending_requests
        overlapping_requests.where(status:'PENDING')
    end

    def overlapping_approved_requests
        overlapping_requests.where(status:'APPROVED')
    end

    def does_not_overlap_approved_request
        if ((self.persisted? && (self.status == 'APPROVED' || self.status== 'PENDING')) || (!self.persisted?))  && overlapping_approved_requests.exists?
            errors.add(:base,"Request overlaps with another that is already approved")  
        end
    end

end
