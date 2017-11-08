# ===============================================
# -------------- DATA SECTION START ------------
# ===============================================

# students = [
# {name: "Dr. Hannibal Lecter", cohort: :november},
# {name: "Darth Vader", cohort: :november},
# {name: "Nurse Ratched", cohort: :november},
# {name: "Michael Corleone", cohort: :november},
# {name: "Alex DeLarge", cohort: :november},
# {name: "The Wicked Witch of the West", cohort: :november},
# {name: "Terminator", cohort: :november},
# {name: "Freddy Krueger", cohort: :november},
# {name: "The Joker", cohort: :november},
# {name: "Joffrey Baratheon", cohort: :november},
# {name: "Norman Bates", cohort: :november}
# ]

# ===============================================
# -------------- DATA SECTION END ---------------
# ===============================================


# ===============================================
# --------- GLOBAL VARIABLES SECTION ------------
# ===============================================

$page_width = 80

# ===============================================
# --------- GLOBAL VARIABLES SECTION END --------
# ===============================================



# ===============================================
# -------------- METHODS SECTION START-----------
# ===============================================

def input_students
    puts "Please add the names of the student you want"
    puts "To finish entering please press Enter twice"
    # create an empty array
    students =[]
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
      puts "What is the cohort the student is in?"
      cohort = gets.chomp.capitalize
      cohorts = ["January", "March","May","June","September","November"]
      if cohort.empty?
        cohort = :no_cohort_specified
        else
          while !cohorts.include? (cohort)
            puts "There is a typo in your entry or the cohort does not exist. Please type the cohort again!"
            cohort = gets.chomp
            end
      end
      cohort = cohort.to_sym
      # ask for the bday of the student
      # puts "What is the date of birth for the student?"
      # bday = gets.chomp
      # # ask for the country of birth
      # puts "What is the country of birth of the student?"
      # bcountry = gets.chomp
      # # ask for the nationality of the student
      # puts "What is the nationality of the student?"
      # national = gets.chomp
      # # ask for the height of the student
      # puts "How tall is the student?"
      # height = gets.chomp
      # add the student hash to the array
      students << {name: name, cohort: cohort}
      # add the student hask to the array - complex
      # students << {name: name, cohort: :november, birthday: bday, country_birth: bcountry, nationality: national, height: height}
      puts "Now we have #{students.count} students"
      # get another name from the user
      puts
      puts "What is the name of the next student?"
      puts "REMEMBER: \"Enter\" twice to exit the student input"
      name = gets.chomp

    end
    # return the array of students
    students
end #def input_students END

# -------------------

def print_header
    puts
    puts "The Students of Villains Academy".center($page_width)
    puts "-----------------------".center($page_width)
    puts
end # print_header END

# -------------------

def print (students)
  puts "Do you want to print all the students? [Y/N]"
  selection = gets.chomp.downcase

  if selection == "y"
      students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]}".ljust($page_width/2) + "(#{student[:cohort]} cohort)".rjust($page_width/2)
      end # students.each do END
    else
      puts "What is the criterion you want to use?"
      puts "\"Length\" OR \"First Letter\""
      criterion = gets.chomp.downcase
      puts
      if criterion == "first letter"
            puts "What is the first letter of the name of the students you want to print?"
            letter = gets.chomp.downcase
            puts
            puts "The student(s) whose name starts with #{letter} are:"
            students.each_with_index do |student, index|
                if student[:name].match (/^#{letter}/i)
                puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
                end
            end # students.each do END
        elsif criterion == "length"
            puts "What is the max length of the name of the students you want to print?"
            length = gets.chomp.to_i
            puts
            puts "The student(s) whose name is shorter than #{length} characters are:"
            students.each_with_index do |student, index|
                if student[:name].length < length
                puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
                end
            end # students.each do END
          else
            puts "You have not selected any criteria. So the only info you will get is:"
            puts
        end # if criterion END
    end # if selection == "y" END

end # print (students) END


def print_footer(students)
  puts
  puts "Overall, we have #{students.count} great students"
end # def print_footer END

# ===============================================
# -------------- METHODS SECTION END ------------
# ===============================================

#  If you want to manually enter students uncomment the line below and
# comment out DATA SECTION ABOVE
students = input_students

# puts students

print_header
print(students)
print_footer(students)
