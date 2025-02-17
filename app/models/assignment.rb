class Assignment < ApplicationRecord
  belongs_to :course
  validates :title, uniqueness: { scope: :course_id }, presence: true
  validates :instruction, :checkpoint, :status, presence: true
  validate :check_instruction_url
  validate :check_material_url

  def check_instruction_url
    unless instruction_url.blank?
      unless instruction_url =~ /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
        errors.add(:instruction_url, "need to be a valid URL")
      end
    end
  end

  def check_material_url
    unless material_url.blank?
      unless material_url =~ /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
        errors.add(:material_url, "need to be a valid URL")
      end
    end
  end

  def self.import(file, course)
    CSV.foreach(file.path, headers: true) do |row|
      assignment = new
      assignment.title = row["title"]
      assignment.instruction = row["instruction"]
      assignment.instruction_url = row["instruction_url"]
      assignment.checkpoint = row["checkpoint"]
      assignment.status = 0
      assignment.start_date = row["start_date"]
      assignment.end_date = row["end_date"]
      assignment.course = course
      assignment.save
    end
  end
end
