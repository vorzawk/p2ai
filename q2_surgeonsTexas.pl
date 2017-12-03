%Facts
occupation(joe,oral_surgeon).
occupation(sam,patent_laywer).
occupation(bill,trial_laywer).
occupation(cindy,investment_banker).
occupation(joan,civil_laywer).
occupation(len,plastic_surgeon).
occupation(lance,heart_surgeon).
occupation(frank,brain_surgeon).
occupation(charlie,plastic_surgeon).
occupation(lisa,oral_surgeon).
address(joe,houston).
address(sam,pittsburgh).
address(bill,dallas).
address(cindy,omaha).
address(joan,chicago).
address(len,college_station).
address(lance,los_angeles).
address(frank,dallas).
address(charlie,houston).
address(lisa,san_antonio).
salary(joe,50000).
salary(sam,150000).
salary(bill,200000).
salary(cindy,140000).
salary(joan,80000).
salary(len,70000).
salary(lance,650000).
salary(frank,85000).
salary(charlie,120000).
salary(lisa,190000).

%Rules to find all the surgeons who live in Texas and make over $100,000/yr

%City-State Relationships for cities relevant to this problem
livesInTexas(X) :- address(X,houston).
livesInTexas(X) :- address(X,dallas).
livesInTexas(X) :- address(X,college_station).
livesInTexas(X) :- address(X,san_antonio).
livesInTexas(X) :- address(X,austin).

%Surgeon or not
surgeon(X) :- occupation(X, oral_surgeon).
surgeon(X) :- occupation(X, brain_surgeon).
surgeon(X) :- occupation(X, plastic_surgeon).
surgeon(X) :- occupation(X, heart_surgeon).

%Lives in Texas and makes over $100,000$/yr
richTexasSurgeon(X) :- livesInTexas(X), surgeon(X), salary(X,Y), Y > 100000.
