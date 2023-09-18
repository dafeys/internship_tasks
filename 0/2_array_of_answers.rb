# https://www.codewars.com/kata/5a3dd29055519e23ec000074/train/ruby

# The first input array is the key to the correct answers to an exam, like ["a", "a", "b", "d"].
# The second one contains a student's submitted answers.
# The two arrays are not empty and are the same length.
# Return the score for this array of answers, giving +4 for each correct answer,
#  -1 for each incorrect answer, and +0 for each blank answer, represented as an empty string.
# If the score < 0, return 0.

# For example:
# checkExam(["a", "a", "b", "b"], ["a", "c", "b", "d"]) → 6
# checkExam(["a", "a", "c", "b"], ["a", "a", "b",  ""]) → 7
# checkExam(["a", "a", "b", "c"], ["a", "a", "b", "c"]) → 16
# checkExam(["b", "c", "b", "a"], ["",  "a", "a", "c"]) → 0


def check_exam(arr1,arr2)
  score = 0
  (0..arr1.length-1).each do |i|
    arr2[i] == arr1[i] ? score += 4 : (arr2[i] == '' ? score : score -= 1)
  end
  score < 0 ? 0 : score
end



puts check_exam(["a", "a", "b", "b"], ["a", "c", "b", "d"]) # 6
puts check_exam(["a", "a", "c", "b"], ["a", "a", "b",  ""]) # 7
puts check_exam(["a", "a", "b", "c"], ["a", "a", "b", "c"]) # 16
puts check_exam(["b", "c", "b", "a"], ["",  "a", "a", "c"]) # 0
puts check_exam(["b", "c", "b", "a"], ["",  "", "", ""]) # 0



# def check_exam(arr1,arr2)
#   score = 0
#   arr1.each_with_index do |element, index|
#     if arr2[index] == ''
#       score
#     elsif element == arr2[index]
#       score += 4
#     else 
#       score -= 1
#     end
#   end
#   score < 0 ? 0 : score
# end
