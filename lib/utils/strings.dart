//fonts family
const String addingTonFont = 'Addington CF';
const String interFont = 'Inter';
//app name
const String appName = 'AKDMVisitorApp';
// app version
const String appVersion = 'App Version';
//splash screen
//splash screen
const String akdmApp = 'Akshardham\nVisitor App';
//introduction screens
const String namasteIntroText = 'Namaste!';
const String firstWelcomeText =
    'Welcome to\n BAPS Swaminarayan Akshardham\n in Robbinsville, New Jersey.\n Please swipe to begin your journey into\n a landmark of Hindu architecture & culture.';
const String planVisit = 'Plan Your Visit';
const String sanctuaryIntroText = 'Sanctuary of Spirituality';
const String secondWelcomeText =
    'visit to Swaminarayan Akshardham\n stirs the soul from within with sights,\n sounds, and silence. If you’d like help\n finding your way around, please grant this\n app temporary access to your location.';
const String missThing = 'Don’t Miss a Thing';
const String thirdWelcomeText =
    'For alerts of events to immerse yourself\n into Hindu culture & spirituality during your visit,\n please agree to accept notifications.';
const String journeyIntroText = 'Journey into Akshardham';
const String fourWelcomeText =
    'Discover Swaminarayan Akshardham, where\n you\'ll find a harmonious fusion of artistry,\n beauty, and timeless Hindu wisdom during\n your pilgrimage into its cultural traditions.';
const String next = 'Next';
const String getStarted = 'Get Started';
const String shareLocation = 'Share Location?';
const String shareLocationDetails =
    'This is the standard iOS/Android prompt for asking a user to share their location with our app.';
const String allowNotification = 'Allow Notifications?';
const String allowNotificationDetails =
    'This is the standard iOS/Android prompt for asking a user to allow our app to send them notifications.';
const String yesText = 'Yes';
const String noText = 'No';
const String screenTwo = '2';
const String screenFour = '4';

//SharedPreferences constants
const String isFirstTimeSplashPref = 'isFirstTimeSplashPref';
const String keyAttractionListForPlanPref = 'keyAttractionListForPlanPref';
const String keySSOUserTokenPref = "keySSOUserTokenPref";
const String keyJSONFileDownloadDatePref = 'keyJSONFileDownloadDatePref';
const String keyMapLocationsJsonEngPref = 'keyMapLocationsJsonEngPref';
const String keySSOUserModule = 'keySSOUserModule';
const String keyIndex = 'selectedIndex';
const String isLocationTap = 'isLocationTap';
const String isNotificationTap = 'isNotificationTap';

//String API_DATA = 'API_DATA';
// Bottom Navigation bar
const String homeMenu = 'Home';
const String exploreMenu = 'Explore';
const String exploreHome = 'Explore';
const String mapMenu = 'Map';
const String addMenu = 'Add';
const String visitMenu = 'Visit';
const String moreMenu = 'More';
const String menuTitle = 'Menu';

//sign in
const String emailHint = 'Enter your email address or phone number';
//const String signInEmail = 'Sign in with email address or phone number';
const String signInEmail = 'Sign in with email';
const String signInPhone = 'Sign in with phone number';
const String orText = 'OR';
const String bapsMember =
    'Registered members of BAPS can login with their SSO credentials';
const String signInSSO = 'Sign in via BAPS SSO';
//Sign out
const String userName = 'Username Admin';
const String mailTo = 'mailto:admin@foobar.com';
const String signOut = 'Sign Out';
//Explore home listview
const String akdmAttraction = 'Akshardham’s Attractions';
const String bookTicket = 'Book Tickets';
const String navigate = 'Navigate';
const String attraction = 'Attractions';
const String select = 'Select';
const String knowMore = 'Know More';
const String hours = 'Hours';
const String dailyAartiTime = 'Daily Aarti Ritual';
const String sunday = 'Sunday';
const String monday = 'Monday';
const String tuesday = 'Tuesday';
const String wednesday = 'Wednesday';
const String thursday = 'Thursday';
const String friday = 'Friday';
const String saturday = 'Saturday';
const String monFri = 'Mon-Friday';
const String time8 = '8:00 PM';
const String time08 = '08:00 PM';
const String time10 = '10:00 AM';
const String time2 = '2:00 PM';
const String time4 = '4:00 PM';
const String addVisit = 'Add to Visit';
const String allText = 'All';
const String experiences = 'Experiences';
const String rituals = 'Rituals';
const String amenities = 'Amenities';
const String listTab = 'List';
const String mapTab = 'Map';
const String dailyTime = '10:00 AM | 04:00 PM';
const String selectedText = 'Selected';
const String selectActivity = 'Please select at least one activity';
const String addToVisit = 'Add to Visit?';
const String ofText = 'of';

String addToActivityList(String activityList) =>
    'This will add $activityList to your visit plan.';

String addToActivityCount(int count) =>
    'This will add $count activities to your visit plan.';

String timeRemain(int minutes) => 'Approximately $minutes minutes';
const String close = 'Close';
const String closed = 'Closed';
//Home Screen
const String attractionDetails = 'Attraction Details';
const String akshardham = 'Akshardham';
const String locationText = 'Pramukh Jyoti Udyan (Glow Garden)';
const String timeMins = 'mins';
const String timeMin = 'min';
const String templeDescription =
    'The Akshardham in New Delhi is the largest comprehensive Hindu Mandir in the world built by Pramukh Swami Maharaj. As it is one of the most well-known works of Pramukh Swami Maharaj, a massive replica of this divine monument has been erected in the Nagar. In this monument reside the Sanatan Vedic murtis of Shri Akshar Purushottam Maharaj along with the Gunatit Guru lineage. Along with the murtis of Bhagwan Shri Sita-Ram, Bhagwan Shr Radha-Krishna, Bhagwan Shri Shiv-Parvati and other great Hindu Devas, Sadhus and rulers of glorious India.';
const String onMap = 'Show on Map   ';
const String addPlanner = 'Added to Planner';
const String markVisited = 'Mark as Visited';
const String visited = 'Visited';
const String carousel = 'Carousel of Experiences';
const String welcomeText = 'Welcome';
const String welcomeDesc =
    'The heart of the Swaminarayan Akshardham complex is the Akshardham mandir. Inaugurated on 6 November 2005, the mandir is an effort to offer a home to God that honors.';
const String readMore = 'Read More';
const String upcomingEvent = 'Upcoming Events';
const String connectWithUs = "Connect with us";
const String viewMore = 'View more';
const String announcement = 'Announcement';
const String date = '16 Apr 2023';
const String imageDesc = 'HH Mahant Swami Maharaj\'s Vicharan';
const String visitPlan = 'Customize Your Visit Plan';
const String myPlan = "My Plan";
const String viewMyPlan = "View my plan";
const String dummyPlanText =
    "Use your plan to ensure you visit these attractions prioritized by you.";
const String visitPlanDesc =
    'View and edit the itinerary for your trip to BAPS Swaminarayan Akshardham.';
const String sliderDesc = 'Live street atmosphere of bal nagari.';
const String myTickets = 'My Tickets';
const String bookTickets = 'Book Now';
const String exiTicket = 'Exhibition Ticket';
const String waterTicket = 'Water Show Ticket';
const String abhiDonation = 'Abhishek Donation';
//more Screen
const String aboutUs = 'About Us';
const String donate = 'Donate';
const String give = 'Give';
const String hoursOperation = 'Hours of Operation';
const String latestNews = 'Latest News';
const String connectLatestNews = 'Connect (News & Events)';
const String newsTitle = 'News';
const String directionCampus = 'Directions to campus';
const String submitFeedback = 'Share your thoughts';
const String followUs = 'Follow Us';
const String visitGuid = 'Visitor Guidelines';
const String glossary = 'Glossary';
const String referAFriend = 'Refer a friend';
const String referAFriendMsg =
    'Visit the Akshardham Maha-mandir with this app as your guide';
const String priPolicy = 'Privacy Policy';
const String termsCond = 'Terms & Conditions';
const String visitorGuidelineTitle = 'Visitor Guidelines';
const String eventRegister = 'Register for Event';
const String dailyEvent = 'Daily Event';
const String optionalText = '(Optional)';
const String requiredText = '*';
const String enterFeedback = 'Enter text here...';
const String submitText = 'Submit';
const String rateExperience = 'How would you rate your experience?';
const String favPlace = 'Select your favorite place';
const String thankYou = 'Thank You';
const String thanksFeedback = 'We appreciate you\n sending us your feedback.';
const String tweetUsText = 'Tweet Us';
const String shareText = 'Share';
const String postText = 'Post';
const String doneText = 'Done';
const String somethingWrong =
    'Something went wrong, please restart the application';
const String requiredField = 'Field is required.';
const String requiredFieldMessage = 'Please insert required fields.';
const String submitingFeedback = 'Submitting...';
const String validEmailMsg = 'Enter valid email address';
const String newsdetail = "News Details";
const String eventdetail = "Event Details";

//Add screen
const String shayonaCafe = 'Shayona cafe';
const String giftShop = 'Gift Shop';
const String donates = 'Donate';

//visit Screen
const String plan = 'Plan';
const String tourTime = 'Mon to Sun, 9am to 6pm. Allow 2 hours for a visit.';
const String cancelText = 'Cancel';
const String editText = 'Edit';
const String myTour = 'My Tour';
const String bookTour = 'Book a Tour';
const String mandirTour = 'Mandir Tours';
const String mandirTourDesc = 'Book a tour for up to 15 guests.';
const String groupTour = 'Request a Group Tour';
const String groupVisits = 'Group Visits';
const String groupTourDesc =
    'For a larger group you may request a group visit.';
const String request = 'Request';
const String getAkshardham = 'Getting to Akshardham';
const String getAkshardhamDesc =
    'From your current location, it looks like it’ll take about an hour and a half to get to Akshardham.';
const String maps = 'Google maps';
const String appleMaps = 'Apple maps';
const String uber = 'Uber';
const String lyft = 'Lyft';
const String accommodations = 'Accommodations';
const String accommodationsTitle = 'BAPS Swaminarayan Chhatralaya';
const String adipur = 'Adipur';
const String warning = 'Alert';
const String connectDevice =
    'Please connect with wired or bluetooth device to play this video.';
const String captionText = 'Caption';

String nightRate(int price) => '\$$price/Night';
const String seeHotels = 'See Hotels';
const String guidelines = 'Guidelines';
const String guidelinesDesc =
    'During your visit, we kindly ask you be respectful of fellow visitors and the campus. See our full list of visitor guidelines to learn more.';
const String viewGuidelines = 'View Guidelines';
const String findWay = 'Finding Your Way Around';
const String findWayDesc =
    'We can help you find Akshardham’s main attractions with live walking directions using your camera.';
const String exploreAttractions = 'Explore Attractions';
const String removeActivity = 'Remove';
const String commingSoon = 'Coming soon';
const String upcomingDescription =
    'With over 3,850 satsang centers around the globe and followers in many other cities,';

//plan visit
//const String personaVisit = 'My Plan';
const String planmyVisit = "Plan my visit";
const String startvisit = "Click here to start";
String planyourVisit =
    "Click the link below to plan out your day at Robbinsville Akshardham? ";

const String activityDesc =
    'Here are some activities we think you’ll enjoy when you visit.';
const String visitTime = 'Current visit time:';
const String hr = 'Hr';
const String planWizard = 'Restart Plan';
const String nilkanthPlaza = 'Take a walk around Nilkanth Varni Plaza.';
const String abhishekPuja = 'Abhishek Mandapam Darshan And Puja';
const String mins30 = '30 mins';
const String addActivity = 'Add Activity';
const String addAnotherActivity = 'Add Another Activity';
const String noActivity =
    'Add activities to your plan here to customize your trip';
const String noAttraction = 'No Attractions Found';
const String addActivityPlan = 'added to your plan.';
const String alreadyAddActivityPlan = 'already added to your plan.';
const String selectedActivityAddedPlan =
    'Selected activities are added in your plan.';
const String removeActivityPlan = 'removed from plan!'; //Activity
const String removeActivityPlanWizard = 'Removed from plan!'; //Activity
const String allRemovedActivityPlan = 'All activities removed from plan!';
const String allActivityPlan = 'All activities are already added in your plan.';
const String viewTour = 'View Tour';

//nagar timing section
const String nagarTiming = 'Nagar Timings';
const String viewAll = 'VIEW ALL';
const String viewAllSmall = 'View all';
const String todayTiming = 'Today\'s Timing';
const String timeSchedule = 'Time Schedule';
const String entry = 'Entry';
const String closing = 'Closing';
const String alreadyAdded = 'Already Added';

//common dialog text
const okText = 'Ok';
const okTextCap = 'OK';
const alertTitle = 'Alert';
const internetMessage = 'Internet appear to be offline.';
const webpageConnectivityMessage = 'No internet connectivity.';
const webpageTimeoutMessage = 'There is an issue while loading a page.';

//add activity
const activityMainTitle = 'Add Activities';
const activityTitle = 'Abhishek Mandapam';

const String activityTime = 'Mins';
const addPlan = 'Add to Plan';
const activityDialogTitle = 'Are You Sure?';
const activityDialog =
    'Do you want to remove this activity from your plan? You can add it back by tapping\n “Add Another Activity” at the bottom of your\n plan.';

const tryAgainMessage = "Try Again";
const errorPageMessage = "Page could not be loaded";
const campusType = "OPEN";
const alertDescription =
    "Please allow 'always' location permission to get continuous updates.";
const noInternetMessage =
    "No internet connection\n found check your\n connection";
const somethingWrongMessage =
    "Something went wrong,\n please restart the\n application";
const siteNotReachMessage = "This site can't\n be reached";
const noNotificationMessage = "No Notifications Yet";

//add section
const String placeShayonaOrder = "Shayona Cafe";
const String placeGiftShopOrder = "Place Gift Shop Order";
const String dailyTimings = "Daily Timings";
const String yourTickets = "Your Tickets";
const String yourBookedTours = "Your Booked Tours";
const String provideFeedback = "Provide Feedback";
const String termsAndConditions = "Terms and conditions";
const localNotificationTitle = "Welcome to Akshardham App!";

//notification
const String notificationList = 'notificationList';
const String notificationTitle = 'Notifications';
const String notificationBackTitle = 'Back';
const String errorImageTitle = 'Error loading Image';
const String noRecordMessage = 'No Record Found.';
const String selectMessage = 'Selected';
const String deleteNotificationMessage =
    'Are you sure you want to\n delete the selected\n notifications?';

//Screen Analytics
const String nameHome = 'HomeScreen';
const String nameMap = 'MapScreen';
const String nameVisit = 'VisitScreen';
const String nameMore = 'MoreScreen';
const String nameIntroduction = 'IntroductionScreen';
const String nameAttractionDetail = 'AttractionDetailScreen';
const String nameNotification = 'NotificationScreen';
const String nameNotificationDetail = 'NotificationDetailScreen';
const String nameMyPlan = 'MyPlanScreen';
const String nameAddPlan = 'AddPlanScreen';
const String nameLogin = 'LoginScreen';
const String nameFeedback = 'FeedbackScreen';
const String namePrivacyPolicy = 'PrivacyPolicyScreen';
const String nameTermsCondition = 'TermsScreen';
const String webpage = 'Webpage';
const String twitterPage = 'TwitterPage';
const String instagramPage = 'InstagramPage';
const String facebookPage = 'FacebookPage';
const String youtubePage = 'YoutubePage';
const String youtubeTitle = 'YouTube';
const String placeShayonaPage = 'PlaceShayonaPage';
const String giftShopPage = 'GiftShopPage';
const String givePage = 'GivePage';
const String visitorPage = 'VisitorPage';
const String startNavigationEvent = 'StartNavigation';
const String exitNavigationEvent = 'ExitNavigation';
const String navigationWayFinding = 'Navigation_WayFinding';

const String locationAllow = 'Location_Allow';
const String locationDisallow = 'Location_Disallow';
const String notificationAllow = 'Notification_Allow';
const String notificationDisallow = 'Notification_Disallow';
const String locationPermission = 'Location Permission';
const String notificationPermission = 'Notification Permission';
const String type = 'Screen';
const String paramType = 'Home';

//home screen back state
const String exit = "Do you want to exit an app?";
const String yes = "Yes";
const String no = "No";

//attraction
const String attraction_type = "Attractions";
const String showList = "Show list";
const String hideList = "Hide list";
const String duration = "Duration";
const String attractionDescription =
    "Visit all the attractions at the Robbinsville Akshardham and add them to your plan.";
const String keyJSONFileDownloadPath = 'keyJSONFileDownloadPath';
const String invalidEvent = 'Invalid event link';
const String navigationMessage = 'Navigation works on-site only';

//Hardcoded static strings
const String dailyText = 'Daily';
const String emailText = 'email';
const String dayText = 'Tuesday';
const String showMoreText = 'Show more';
const String showLessText = 'Show less';
