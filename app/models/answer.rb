class Answer < ApplicationRecord
  belongs_to :company, class_name: "Company"
  belongs_to :question, class_name: "Question"
  belongs_to :validator, class_name: "User", :foreign_key => :user_id, optional: true
  has_many :active_relationships, class_name: "Relationship", foreign_key: "answer_id", dependent: :destroy
  has_many :evidences, through: :active_relationships
  
  def create_evidence(ed)
    evidences << ed
  end
  
  def delete_evidence(ed)
    evidences.delete(ed)
  end
  
  def has_evidence?(ed)
    evidences.include?(ed)
  end
end
