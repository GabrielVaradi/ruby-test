# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  found = nil
  @candidates.each do |candidate|
    if candidate[:id] == id
      found = candidate
    end
  end
  found
end

def experienced?(candidate)
 candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  candidatesArray = []
  candidates.each do |candidate|
  if meet_criteria?(candidate)
    candidatesArray << candidate
    end
  end
candidatesArray
end

def meet_criteria?(candidate)
  experienced?(candidate) && candidate[:github_points] >= 100 && candidate[:age] >= 18 && knows_languages?(candidate) && application_date?(candidate)

end

def knows_languages?(candidate)
  candidate[:languages].include? "Ruby" || candidate[:languages].include?("Python")
end

def application_date?(candidate)
   (Time.current - 15.day).to_s.to_date < candidate[:date_applied].to_s.to_date
end

def ordered_by_qualifications?(candidates)
  sorted = candidates.sort_by { |candidate| [candidate[:years_of_experience], candidate[:github_points]] }
  sorted
end
