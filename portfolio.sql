CREATE TABLE cards(
	ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	imgPath VARCHAR(15) NULL,
	title VARCHAR(25) NULL,
	content VARCHAR(140) NULL,
	link VARCHAR(50) NULL
);

CREATE TABLE casestudy(
	ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	parent int Null,
	title VARCHAR(25) NULL,
	content VARCHAR(500) NULL,
	link VARCHAR(150) NULL
);

--some help
'SELECT ID, title, content, link FROM casestudy WHERE parent = ' . . ' ORDER BY ID ASC'; 
$sql = "SELECT a.ID, b.ID, b.title, b.content, b.link FROM casestudy a, casestudy b WHERE b.parent = '" . intval($_GET['study']) . "' ORDER BY b.ID ASC";

--http://stackoverflow.com/questions/4285664/how-to-adjust-display-settings-of-mysql-command-line

--drops
DROP TABLE cards;
DROP TABLE casestudy;

--reset 
DELETE FROM cards;
ALTER TABLE cards AUTO_INCREMENT = 1;
DELETE FROM casestudy;
ALTER TABLE casestudy AUTO_INCREMENT = 1;

--examples 
INSERT INTO cards (imgPath, title, content, link) VALUES ('img1.jpeg', 'Hello World!', 'This is our legendary card sorting', '1');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Parent.', 'We reinvented the wheel.');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Child.', 'We made the wheel.');

--cards
INSERT INTO cards (imgPath, title, content, link) VALUES ('fc.jpeg', 'Fat Cloudy', 'Fat Cloudy is the "more mobile" spiritual successor to my original App Store game, Baby Cloudy. What does it mean to be "more mobile"?', '1');
INSERT INTO cards (imgPath, title, content, link) VALUES ('taps.jpeg', 'TAPS', 'TAPS was an entrant of the Bluestone Hackathon at James Madison University.', '2');
INSERT INTO cards (imgPath, title, content, link) VALUES ('cis.jpeg', 'CIS in Europe', 'After studying in Sweden, a question arose, how could design instantiate hybrid education?', '3');


--alter table
ALTER TABLE casestudy
MODIFY COLUMN link VARCHAR(150) NULL; 

ALTER TABLE casestudy
MODIFY COLUMN content VARCHAR(500) NULL; 

--table drops
DROP TABLE cards;
DROP TABLE casestudy;

--under construction
INSERT INTO casestudy (parent, title, content, link) VALUES (2,'Under Construction', 'This study is being reviewed at the moment and will be up soon!', '<br>Check out my old portfolio for meanwhile at <a href="http://www.alejandroquesada.com" style="color:white;">alejandroquesada.com</a>!');

--reset 
DELETE FROM cards;
ALTER TABLE cards AUTO_INCREMENT = 1;
DELETE FROM casestudy;
ALTER TABLE casestudy AUTO_INCREMENT = 1;
INSERT INTO cards (imgPath, title, content, link) VALUES ('fc1.jpeg','Fat Cloudy', 'Fat Cloudy is the "more mobile" spiritual successor to my original App Store game, Baby Cloudy. What does it mean to be "more mobile"?', '1');
--INSERT INTO cards (title, content, link) VALUES ('TAPS', 'TAPS was an entrant of the Bluestone Hackathon at James Madison University.', '2');
INSERT INTO cards (imgPath, title, content, link) VALUES ('cis4.jpeg', 'CIS in Europe', 'After studying in Sweden, a question arose, how could design improve hybrid education?', '2');
INSERT INTO cards (title, content, link) VALUES ('Greek Life', 'How can a lightweight system be designed to bring together a Collegiate Greek chapter?', '3');

INSERT INTO casestudy (parent, title, content, link) VALUES (1,'Fat Cloudy Overview', '<p>In 2013\, my design career began when my intial App Store game, \'Baby Cloudy\', was unintentionally poorly designed. It was a year later, I would release an updated title, \'Fat Cloudy\’ that was a “more mobile” entity. It\’s release trailer appears below:</p><iframe width=“100%” height=“320px” src="https://www.youtube.com/embed/vzFfXSYFXQo" frameborder="0" allowfullscreen></iframe>', '<a href=“http://www.redpause.com/fat-cloudy.html”>View Informational Website</a>');
INSERT INTO casestudy (parent, title, content) VALUES (2,'CIS in Europe Overview', '<p>This upcoming summer, the CIS Department of James Madison University will host a study abroad trip in Germany under the instruction of Professor Carey Cole. For the professor, I have explored designs capability of enabling students dictation and fluency in web and database principles.</p>');

INSERT INTO casestudy (parent, title, content) VALUES (1,'More Mobile', '<p>Mobile design begs for prioritization. Fat Cloudy needed an absolute focus that a user was geared towards. Given it was to be a mobile video game with Ads for monetization, a simple \'Funnel\' model (view below) was developed to capture imperative touch points and focus the mediums experience. My deducted object of focus was in emphasizing user retention through addictive gameplay.</p><img id=“gameplay-funnel” src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/fc2.jpeg”>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Competitive Inspiration', '<p>The mobile game arena is saturated in both shovelware and quality content. The latter of which I was shameless in mimicking. Fat Cloudy\’s gameplay and monetization strategy was heavily influenced by 2013\’s cultural phenomenon, \’Flappy Bird\’.  It\’s approach to tutorials was inspired by \’Angry Birds\’, psuedo-infinite structure by \’Subway Surfer\’ and with the visual zen of \’Blek\’.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Mobile Leverage', '<p>Fat Cloudy was designed for touch in it\’s utilization of signifiers for affordances and as well in it\’s digestible immersion. One could simply one-handedly cycle through a few games on a crowded and bumpy bus in Jackson, Mississippi and be attentive enough to exterior events. This on-the-go play is simply how the title was meant to work and would be dumbfounded on any other platform.</p><img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/fc4.jpeg”>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Race to the Bottom', '<p>This type of B2C application would be DOA for 0.99 cents given the industries ease of entry and high threat of substitution, which among others things, grants independent developers like myself a negligible bargaining power with buyers if a Porter\’s Five Forces model was consulted. Conclusively my app required a design that maximized unobtrusive Ads. Fat Cloudy\’s answer was in it\’s \’Galaga\’ meets \’Brick Breaker\’ gameplay which provided well for retaining casual gamers.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Rapid Fire Cycles', '<p>Following \'Race to the Bottom\' above, I developed a model (seen below) that summates Fat Cloudy\’s \‘Rapid Fire Win/Lose Cycle\’. A gameplay cycle of which mirrors aforementioned \'Flappy Bird\'. </p><img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/fc3.jpeg”>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Usability Analysis', '<p>In the MVP iteration of Fat Cloudy, the above models were tested. Mods were made for the app\’s navigational signifiers. The original icon-based layout became text buttons in version 1.5 (pictured below). The traditional style was more intuitive in guiding user\’s through the Gameplay Funnel (<a href=“#gameplay-funnel”>above</a>). This doubly improved user\’s \’first date\’ with the app.<img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/fc5.jpeg”>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Maintenance', '<p>Post-release quantitative data collected via a platform, called Appformative, suggested cycles could be more rapid. An obstacle within the game was the lack of a \'restart\' button upon a loss. The data, further usability examinations and common sense made indicative of a need for such a control.  Another cycle steroid came in the form of \'Daily Rewards\’ and a \'Point Bank\’ that allowed one to revive their avatar with all points kept. The improvements quadrupled player cycles.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Conclusion', '<p>The contrast to “more mobile” is entropy and a lack of platform leverage. Baby Cloudy left too much opportunity for things user\’s didn\’t know they didn\’t know. Mobile design prioritizes tasks and fixates themselves around that common goal. This approach accommodates the array of screens produced for mobile computing and an expected ease of use intended for touch devies that function more as an extension of one\’s self than an obstacle. Fat Cloudy works off of the above.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'Takeaway', '<p>I learned that deeper research earlier on would have saved this project from a few missteps. It is a lesson that has since informed post-projects. However Fat Cloudy was completed and is something I am proud of.</p>');
INSERT INTO casestudy (parent, title, content, link) VALUES (1,'Google Play', '<p>As of today only the far less popular Google Play Fat Cloudy exists. The iOS version (with around 4000 downloads) was deprecated due to it\’s engine, Gamesalad, being incompatible with the latest iOS versions.</p>','<a href=“https://play.google.com/store/apps/details?id=com.redpause.fatcloudy2&hl=en”>View Google Play Listing</a>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'The Future', '<p>A sequel is in development. No release date as of this moment, developmental technologies being used are LUA and Corona SDK. A contrast to the original\’s Gamesalad roots. The title will once more be for Android and iOS.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (1,'The Past', '<p>Below is Baby Cloudy\’s trailer. It\’s here for nostalgic purposes.</p><iframe width=“100%” height=“320” src="https://www.youtube.com/embed/OTNQZQHQWdw" frameborder="0" allowfullscreen></iframe>');

INSERT INTO casestudy (parent, title, content) VALUES (2,'Getting Started', '<p>The month program concludes on a final project that integrates a website and a SQL Server Database hosted on a WIMP stack. The object of my focus came in re-designing the project so it most naturally integrated all of the course content that preceded it, therein creating purpose for the aforementioned knowledge.</p> <img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/cis2.jpeg”>');
INSERT INTO casestudy (parent, title, content) VALUES (2,'User Interviews', '<p>My initial research found me exchanging dialogue with former program students. The qualitative interviews brought to light many common pain-points, more specifically pertaining to role clarity and PHP complexities (as a month is a short time to learn several languages). My takeaway was to communicate project requirements in a more visual manner in lieu of walls of text.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (2,'Persona Development', '<p>I fabricated user archetypes in persona development to engage design thinking on my part. The persona renditions came in the form of a lazier professor and 3 students of different technical skill levels and expectations. This encouraged new web responsive requirements for the final project so the professor could grade clearer requirements. Students, regardless of skill, require the most skimmable yet sticky instruction possible.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (2,'The Product', '<p>To provide a cerebrum of visually driven knowledge, a host had to exist. Given the final project was a website, I developed one of my own that replicated all of the original requirements. This website would both act as an example of a completed project and host the wiki I am to create.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (2,'Information Architecture', '<p>A platform of this density carries with it the opportunity of damaged clarity. However, the notion of simplicity and the utilization of card-sorting techniques below led us to a simple Information Architecture of the \’to-be\’ system.</p><img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/cis1.jpeg”>');
INSERT INTO casestudy (parent, title, content) VALUES (2,'Wireframe Process', '<p>At some point, research must take a back seat to execution. Given all of the constraints discovered, I used Balsamiq Mockups to quickly concoct several low-fidelity designs. One of which is represented below of the ''Study'' screen where the Wiki will be accessible.</p><img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/cis3.jpeg">');
INSERT INTO casestudy (parent, title, content, link) VALUES (2,'Prototype', '<p>The current prototype as of the beginning of 2016 may be found <a href=“http://52.36.75.68/cisineurope/index.php”>here</a>. Development will conclude by April 2016.</p>', '<a href=“http://52.36.75.68/cisineurope/index.php”>View Prototype</a>');
INSERT INTO casestudy (parent, title, content) VALUES (2,'Conclusion', '<p>Design''s capacity to improve hybrid education exists in it''s capacity to dissapear and be self-explanatory. Our online platform (akin to a W3 School for our program''s final) will act as a reference of practiced knowledge and instruction. By maintaining a flat Information Architecture with an approach to sharing via a no nonsense Wiki, we will manage to answer most questions before they are known to be unknown and provide an Amazon-direct path to answers in both content and form.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (2,'Current Status', '<p>Development will be complete by April 2016. Technologies utilized are: PHP, HTML, CSS, JS (w/ jQuery), SQL Server and an AWS WIMP Stack.</p>');

INSERT INTO casestudy (parent, title, content) VALUES (3,'Greek Life Overview', '<p>Each year a new executive board is selected to run each Greek Chapter on campuses across the United States. They come in with many ideas with the primary obstacle of execution. Several tools are used to keep the Chapter in the know. Emphasis on several.</p><br><p style=“font-size:75%;color:gray”><i>To comply with my NDA, I have omitted confidential information in this case study. The information in this case study is my own and does not necessarily reflect the views of Greek Life.</i></p>');
INSERT INTO casestudy (parent, title, content) VALUES (3,'My Role', '<p>I am the primary digital product designer of the project. While each member of the team (whether business-minded or an engineer) contributed to the overall design via collaboration. I was charged in visualizing and leading the conversation.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (3,'Team Experience', '<p>My team and I originally worked together on the executive board for Theta Chi\’s Eta Kappa Chapter at James Madison University during the 2015 calendar year. We have used our experiences in leading this type of organization in the pursuit of this project.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (3,'As-Is Approach', '<p>We consulted several heads of different organizations and Greek Chapters and found the majority of communication structures were based off of the following tools: text messages, email, Facebook Groups and GroupMe.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (3,'Industry Analysis', '<p>We analyzed the industry through Porters 5 Forces (seen below) to guide our direction. After the analysis it was clear we were set to leverage mobile computers as our primary platform.</p><img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/gl2.jpg”>');
INSERT INTO casestudy (parent, title, content) VALUES (3,'User Funnel', '<p>In order to comply with a proper light-weight mobile focus (a contrast and differentiator to heavy-weight organizational applications such as Trello or Slack), a goal was derived for our digital product. A funnel to isolate important functions was derived as seen below:</p><img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/gl3.jpg”>');
INSERT INTO casestudy (parent, title, content) VALUES (3,'Journey Map', '<p>Accounting for the application\’s light-weight structure and simple information architecture, we mocked up a user journey map to aid in understanding the interactions a user would have with our application. A very early version is seen below:</p><img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/gl5.jpg”>');
INSERT INTO casestudy (parent, title, content) VALUES (3,'Low-Fidelity Wireframes', '<p>With an understanding of the application\’s purpose and how it was to be utilized, many low-fidelity wireframes were sketched. They would then arrive at the \’kill squad\’ and be dissected. About 20 iterations in, we landed on a generally favorable version that has since been further challenged in usability tests. One of our low-fidelity wireframe appears below:</p><img src=“https://dl.dropboxusercontent.com/u/59744229/portfolio%20images/gl4.jpg”>');
INSERT INTO casestudy (parent, title, content) VALUES (3,'Conclusion', '<p>With little detail on the \’how\’ above, what can be said is we are building upon principles of assumptive design to make thorough communication possible within one\’s Greek organization with the smallest tool possible in favor of the \’as-is\’ triad of solutions. This will allow organizations to focus more on their brotherhood or sisterhoods and less on why Joe didn\’t appear for Thursday\’s social with sorority, Kappa Delta.</p>');
INSERT INTO casestudy (parent, title, content) VALUES (3,'Current Status', '<p>The designs of the MVP are complete and our engineer is at work. Early on I created a tentative timeline for version releases and am at work defining features that will inform the future of the application.</p>');

