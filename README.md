# hamzahllc

A new Flutter Task For Hamzahllc.


(1) Advanced Networking and Data Handling:


- in this point i have integrated powerful API service using [dio] which can handle all error cases

- i have inject my service using [get_it]

- i used to handle ui part with [flutter_bloc] state management

----------------------------------------

(2) Secure Authentication and User Management:

- I used to implement multi-factor authentication system with support for biometric using [local_auth]
also secondary authentication methods using email / password using [firebase]

- in integrate Auth 2.0 authorization framework i use [google_sign_in] to reach this goal

- in end-to-end encryption for sensitive user i used [flutter_secure_storage] plugin to encrypt
my email / pass

- also i have saved all important and secret keys in [.env] file and i could apple to read them 
using [flutter_dotenv]

----------------------------------------

(3) Robust Database Integration and Offline Support:

- i used NYT API to fetch articles also used [flutter_cache_manager] & [connectivity_plus] to handle
offline read option at least 

- i used [work_manager] to sync data in background and keep it updated

----------------------------------------

(4) Advanced Ul/UX Design and Development:

I have created 5 screens with cool basic UI 

- splash
- login
- register
- articles
- articles_details

- i have used [flutter_staggered_animations] for adding some easy animation in articles screen

- i have used [Hero] widget also for adding some animation between articles & articles_details

- i have used some complex animation in splash using [AnimationController]

- i have add articles_details screen to show more info for articles also you can view full article
using [url_launcher]

- all my screens are responsive working for wide range of devices, screen sizes, and orientations
using help with [flutter_screenutil]
 
----------------------------------------

(5) Performance Optimization and Scalability:

- I have use allocations temple to record any  growth of memory usage, and look for
any unusual increases in memory allocations.


----------------------------------------
