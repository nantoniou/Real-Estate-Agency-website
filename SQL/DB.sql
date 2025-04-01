/* ismgroup9 is a schema created in the schemas section.. 
Create schema ismgroup9 default CHAR SET utf8; ----*/ 

use ismgroup9;

DROP table IF EXISTS favourites;
DROP table IF EXISTS housePictures;
DROP table IF EXISTS user;
DROP table IF EXISTS messages;
DROP table IF EXISTS listing;

CREATE TABLE listing (
	 houseid int auto_increment,
     title varchar(120) NOT NULL,
     descriptionHouse varchar(1000),
     area varchar(50) NOT NULL,
     forSale boolean,
     sqm float,
     price int,
     floor varchar(50) NOT NULL,
     bedrooms int,
     floortiles varchar(50) NOT NULL,
     bathrooms int,
     constructionDate int,
     heating varchar(50) NOT NULL,
     balcony boolean,
     elevator boolean,
     renovated boolean,
     furnished boolean,
     PRIMARY KEY (houseid)
); 
CREATE TABLE user (
	 userid int auto_increment,
     fname varchar(50) NOT NULL,
     lname varchar(50),
     descriptionUser varchar(1000),
     email varchar(50) NOT NULL,
     username varchar(30),
     phone long,
     userpassword varchar(30),
     userPhotoPath varchar(120) DEFAULT 'images/UserDefault.png',
     PRIMARY KEY (userid)
);

CREATE TABLE housePictures (
  picId     INT auto_increment,
  house     INT ,
  picPath varchar(500),
  PRIMARY KEY (picId),
  FOREIGN KEY (house) REFERENCES listing(houseid)
  );

CREATE TABLE favourites (
  favouriteId     INT auto_increment,
  houseid    int ,
  userid int,
  PRIMARY KEY (favouriteID),
  FOREIGN KEY (userid) REFERENCES user (userid),
  FOREIGN KEY (houseid) REFERENCES listing (houseid)
  );

CREATE TABLE messages (
  messageID int auto_increment,
  uid int,
  fname varchar(20),
  lname varchar(20),
  email varchar(50),
  topic varchar(50),
  message varchar(1500),
  timeofcontact datetime,
  PRIMARY KEY (messageID),
  FOREIGN KEY (uid) REFERENCES user (userid)
  );
  

/* πώληση */

Insert into listing values(null, "Επιπλωμένη γκαρσονιέρα στο Λακκί", "Επιπλωμένη γκαρσονιέρα προς πώληση σε άριστη κατάσταση, 1ου ορόφου, γωνιακή, εσωτερική, 1 υ/δ, μπάνιο, κατασκευή '06, επιπλωμένη, αυτόνομη θέρμανση, πόρτα ασφαλείας, ελεύθερη. Διαθέτει μεγάλο γωνιακό μπαλκόνι. Είναι σε πολύ κεντρικό σημείο και πολύ φωτεινό. Tιμή συζητήσιμη.", "Λακκί", true, 60, 30000, "1ος", 1, "Παρκέ", 1, 2006, "Αυτόνομη θέρμανση", true, true, true, true);

Insert into listing values(null, "Γκαρσονιέρα στην Αγ. Μαρίνα", "Παραδοσιακή επιπλωμένη γκαρσονιέρα προς πώληση σε καλή κατάσταση, ισόγειο, 1 υ/δ, 1 μπάνιο, κουζίνα, κατασκευή '01, αυτόνομη θέρμανση με φυσικό αέριο. Διαθέτει αυλή με μικρό κήπο. Tιμή συζητήσιμη.", "Αγ. Μαρίνα", true, 47, 21000, "Iσόγειο", 1, "Παρκέ", 1, 2001, "Αυτόνομη θέρμανση", true, false, true, true);

Insert into listing values(null, "Διαμέρισμα στο Λακκί", "Διαμέρισμα προς πώληση σε άριστη κατάσταση, 1ου ορόφου, γωνιακή, 3 υ/δ, 1 μπάνιο, κουζίνα, κατασκευή '97, κεντρική θέρμανση. Βρίσκεται πλησίον στάση λεωφορείου. Διαθέτει μεγάλο μπαλκόνι.", "Λακκί", true, 47, 55000, "Iσόγειο", 1, "Παρκέ", 1, 1997, "Κεντρική θέρμανση", true, false, true, false);

Insert into listing values(null, "Μεζονέτα στα Άλιντα", "Διώροφη μεζονέτα προς πώληση σε άριστη κατάσταση, 3 υ/δ, 2 μπάνια, κατασκευή '10, κοντά στη θάλασσα, φυσικό αέριο, πόρτα ασφαλείας, ελεύθερη. Διαθέτει μεγάλα μπαλκόνια με θέα τη θάλασσα", "Άλιντα", true, 120, 85000, "Διώροφη", 3, "Παρκέ", 2, 2010, "Φυσικό αέριο", true, false, false, false);


/* ενοικίαση */
Insert into listing values(null, "Επιπλωμένη γκαρσονιέρα στο Λακκί", "Επιπλωμένη γκαρσονιέρα προς ενοικίαση σε άριστη κατάσταση, ισόγειο, 1 υ/δ, μπάνιο, κατασκευή '05, επιπλωμένη, αυτόνομη θέρμανση, πόρτα ασφαλείας, ελεύθερη. Διαθέτει μπαλκόνι με θέα τη θάλασσα. Άμεσα διαθέσιμο. Tιμή συζητήσιμη.", "Λακκί", false, 65, 250, "Iσόγειο", 1, "Παρκέ", 1, 2005, "Αυτόνομη θέρμανση", true, true, true, true);

Insert into listing values(null, "Επιπλωμένo διαμέρισμα στα Άλιντα", "Επιπλωμένο δυάρι προς ενοικίαση σε καλή κατάσταση, 1ου ορόφου, γωνιακή, 2 υ/δ, 1 μπάνιο, μεγάλη κουζίνα, κατασκευή '69, κεντρική θέρμανση. Βρίσκεται κοντά στο γενικό λύκειο Λέρου.  Άμεσα διαθέσιμο", "Άλιντα", false, 50, 250, "Iσόγειο", 1, "Πλακάκι", 1, 1969, "Κεντρική θέρμανση", true, false, false, true);

Insert into listing values(null, "Επιπλωμένο διαμέρισμα στα Άλιντα", "Επιπλωμένο διαμέρισμα προς ενοικίαση σε άριστη κατάσταση, 1ου ορόφου, 2 υ/δ, 1 μπάνιο, κουζίνα, κατασκευή '93, κεντρική θέρμανση. Βρίσκεται πλησίον παραλίας και σουπερ-μάρκετ. Διαθέτει μεγάλο μπαλκόνι. Διαθέσιμο από 1 Ιανουαρίου 2019", "Άλιντα", false, 62, 230, "1ος όροφορς", 1, "Πλακάκι", 1, 1993, "Κεντρική θέρμανση", true, true, true, true);

Insert into listing values(null, "Επιπλωμένο διαμέρισμα στο Ξηρόκαμπο", "Επιπλωμένο δυάρι προς ενοικίαση σε άριστη κατάσταση, 2ου ορόφου, 2 υ/δ, 1 μπάνιο, κατασκευή '03, κεντρική θέρμανση. Διαθέτει μεγάλο μπαλκόνι. Η πολυκατοικία διαθέτει ασανσέρ. Βρίσκεται πλησίον στάση λεωφορείου. Θα είναι διαθέσιμο από 15 Φεβρουαρίου 2019", "Ξηρόκαμπος", false, 71, 310, "2ος όροφος", 2, "Παρκέ", 1, 2003, "Κεντρική θέρμανση", true, true, false, true);


/* πώληση */
insert into housePictures values (null, 1 , "images/1sale1.jpg ");
insert into housePictures values (null, 1 , "images/1sale2.jpg ");
insert into housePictures values (null, 1 , "images/1sale3.jpg ");
insert into housePictures values (null, 1 , "images/1sale4.jpg ");
insert into housePictures values (null, 1 , "images/1sale5.jpg ");
insert into housePictures values (null, 2 , "images/2sale1.jpg ");
insert into housePictures values (null, 2 , "images/2sale2.jpg ");
insert into housePictures values (null, 2 , "images/2sale3.jpg ");
insert into housePictures values (null, 2 , "images/2sale4.jpg ");
insert into housePictures values (null, 2 , "images/2sale5.jpg ");
insert into housePictures values (null, 3 , "images/3sale1.jpg ");
insert into housePictures values (null, 3 , "images/3sale2.jpg ");
insert into housePictures values (null, 3 , "images/3sale3.jpg ");
insert into housePictures values (null, 3 , "images/3sale4.jpg ");
insert into housePictures values (null, 3 , "images/3sale5.jpg ");
insert into housePictures values (null, 4 , "images/4sale1.jpg ");
insert into housePictures values (null, 4 , "images/4sale2.jpg ");
insert into housePictures values (null, 4 , "images/4sale3.jpg ");
insert into housePictures values (null, 4 , "images/4sale4.jpg ");
insert into housePictures values (null, 4 , "images/4sale5.jpg ");
/*ενοικίαση*/
insert into housePictures values (null, 5 , "images/5rent1.jpg ");
insert into housePictures values (null, 5 , "images/5rent2.jpg ");
insert into housePictures values (null, 5 , "images/5rent3.jpg ");
insert into housePictures values (null, 5 , "images/5rent4.jpg ");
insert into housePictures values (null, 5 , "images/5rent5.jpg ");
insert into housePictures values (null, 6 , "images/6rent1.jpg ");
insert into housePictures values (null, 6 , "images/6rent2.jpg ");
insert into housePictures values (null, 6 , "images/6rent3.jpg ");
insert into housePictures values (null, 6 , "images/6rent4.jpg ");
insert into housePictures values (null, 6 , "images/6rent5.jpg ");
insert into housePictures values (null, 7 , "images/7rent1.jpg ");
insert into housePictures values (null, 7 , "images/7rent2.jpg ");
insert into housePictures values (null, 7 , "images/7rent3.jpg ");
insert into housePictures values (null, 7 , "images/7rent4.jpg ");
insert into housePictures values (null, 7 , "images/7rent5.jpg ");
insert into housePictures values (null, 8 , "images/8rent1.jpg ");
insert into housePictures values (null, 8 , "images/8rent2.jpg ");
insert into housePictures values (null, 8 , "images/8rent3.jpg ");
insert into housePictures values (null, 8 , "images/8rent4.jpg ");
insert into housePictures values (null, 8 , "images/8rent5.jpg ");

/* administrator */
insert into user values (null, 'Administrator', null, null, 'realEstate@yahoo.com', 'admin', null, 'admin', DEFAULT);

/*users*/
insert into user values (null, 'Νίκος', 'XXX', 'Είμαι καθηγητής που μόλις μετακόμισε και αναζητώ μόνιμη κατοικία στη Λέρο. Ψάχνω ένα ευάρερο, ευήλιο και οικονομικό δυάρι, κατά προτίμηση κοντά στο Γενικό Λύκειο Λέρου.', 'nikos1@gmail.com', 'nikos1', '301234567', '1111', DEFAULT);
insert into user values (null, 'Adam', 'Smith', 'Stuffs', 'adam@smith.com', 'asdfg', '30123456', '1111', DEFAULT);
insert into user values (null, 'John', 'Doe', 'Stuffs', 'john@doe.com', 'jdoe', '30123456', '1111', DEFAULT);
