Header header
int32 no_of_points
float32[] x  #store all x coordinates
float32[] y
float32[] z
int32 plan  #to start planning
int32 execute #to start execute
int32 command #this can be more useful than plan, execute alone. e.g. if command==1, do planning, if command==2, do executing, etc.
