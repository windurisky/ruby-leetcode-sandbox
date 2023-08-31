# Graph Algorithms:
# Solve problems involving graphs using algorithms like Dijkstra's, Kruskal's, or topological sort.
# Useful for problems that model relationships between elements.

# Problem: Course Schedule II (Topological Sort)
def find_order(num_courses, prerequisites)
  graph = Array.new(num_courses) { [] }
  in_degree = Array.new(num_courses, 0)
  
  prerequisites.each do |course, prereq|
    graph[prereq] << course
    in_degree[course] += 1
  end
  
  queue = []
  in_degree.each_with_index { |degree, course| queue << course if degree == 0 }
  
  result = []
  until queue.empty?
    course = queue.shift
    result << course
    graph[course].each do |next_course|
      in_degree[next_course] -= 1
      queue << next_course if in_degree[next_course] == 0
    end
  end
  
  result.size == num_courses ? result : []
end
