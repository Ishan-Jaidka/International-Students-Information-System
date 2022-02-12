/*
 * Ishan Jaidka & Duncan Garing
 * CS331
 * 12/5/2020
 * Group Project: Database Interface Java Application
 */

/*
 * This application interfaces with a database we designed that stores information about 
 * international students, both current and graduated. The application connects to the 
 * database after prompting the user for login info, then it allows users to access details 
 * stored in the database with preconfigured queries. The update function requires an 
 * additional login, username (admin) and password (admin), and it allows users to update 
 * or delete certain details stored in the database.
 * 
 * App demo: https://youtu.be/0sxtlQhBy0A
 * 
 * Login info:
 * 		Connect to database:
 * 			username: student
 * 			password: password
 * 
 * 		Option 4: Update
 * 			username: admin
 * 			password: admin
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class InternationalStudents {

    private static final String dbuser = "admin";
    private static final String dbpassword = "International69";
    private static final String dbschema = "InternationalStudents";


	public static void main(String[] args) throws IOException, InstantiationException, IllegalAccessException {
		Connection conn = null;
        try {
            //Step 1: Load the JDBC driver(You have to have the connector Jar file in your project Class path)
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            //Class.forName("com.mysql.cj.jdbc.Driver");

            //Connect to the database(Change the URL)

            String url = "jdbc:mysql://international-student-information-system.cbvn3pj3lwdr.us-east-1.rds.amazonaws.com:3306/";
            url += dbschema + "?user=" + dbuser + "&password=" + dbpassword;
            // old URL: "jdbc:mysql://localhost:3306/InternationalStudents?serverTimezone=UTC&useSSL=TRUE";
            String user = "", pass = "", admin = "", adminpass = "";
            
            printHeader();
            
            boolean userpass = false; //check if user/pass is correct
            while (!userpass) {
            user = readEntry("Enter User ID : ");
            pass = readEntry("Enter password: ");
            if (!user.equals("student") || !pass.equals("password")) {
            System.out.println("\n\nIncorrect user ID or password\n\n");
            } else {
            	System.out.println("\n\nLogging in..\n\n");
            	userpass=true;
            }
            }
            
            
            conn = DriverManager.getConnection(url, dbuser, dbpassword);
            
            printMenu();
            System.out.print("Type in your option: ");
            System.out.flush();
            String ch = readLine();
            System.out.println("*****************************************************************************");

            boolean done = false; //for main menu do/while switch
            boolean done4, doneD, gDone, aDone, cDone, doneSc3, sDone; //for do/while switch loops
            boolean count = false; //if main menu has displayed before
           
            do {
            	 if (count != false) {
            		 printMenu();
            		 System.out.print("Type in your option: ");
            		 System.out.flush();
            		 ch = readLine();
            		 System.out.println();
            		 System.out.println("*****************************************************************************");
            	 }
            	 count = true;
                switch (ch.charAt(0)) {
                
                //Option 1: Current Student option
                    case '1':
                    	System.out.println("Under Construction...\n\n");
                        break;
                        
                //Option 2: Graduated Student option
                    case '2': 
                    	gDone = false;
                    	do {
                    	String gOp;
                        printGradMenu();
                        System.out.print("Type in your option: ");
                        System.out.flush();
                        gOp = readLine();
                        System.out.println();
                        System.out.println("*****************************************************************************");
                        switch (gOp.charAt(0)) {
                        
                        //Grad Stud Info: Academic Info Menu
                        case '1': 
                        	aDone = false;
                        	do {
                        		String stuInf;
                        		printAcademicInfoMenu();
                        		System.out.print("Type in your option: ");
                                System.out.flush();
                                stuInf = readLine();
                                System.out.println();
                                System.out.println("*****************************************************************************");
                                
                                switch(Character.toUpperCase(stuInf.charAt(0))) {
                                case 'A' :
                                	String edSSN;
                                	System.out.print("Type in the SSN of the Student: ");
                                    System.out.flush();
                                    edSSN = readLine();
                                	edHis(conn, edSSN);
                                	break;
                                case 'B':
                                	String colName;
                                	System.out.print("Type in the Name of the College: ");
                                    System.out.flush();
                                    colName = readLine();
                                    
                                	cStuInfo(conn,colName);
                                	break;
                                case 'C':
                                	aDone = true;
                                	System.out.println("Returning to Graduate Student menu");
                                	break;
                                default:
                                	System.out.println("Invalid input. Please try again.");
                                	break;
                                }
                        	} while (!aDone);
                        	break;
                        	
                        //Grad Stud Info: Contact Info Menu
                        case '2':
                        	cDone = false;
                        	do {
                        		String conInfo;
                        		printContactInfoMenu();
                        		System.out.print("Enter your option: ");
                                System.out.flush();
                                conInfo = readLine();
                                System.out.println();
                                System.out.println("*****************************************************************************");
                                
                                switch(Character.toUpperCase(conInfo.charAt(0))) {
                                case 'A' :
                                	allContactInfo(conn);
                                	break;
                                case 'B':
                                	String couName;
                                	System.out.print("Enter the Name of the Country: ");
                                    System.out.flush();
                                    couName = readLine();
                                    
                                	fromCountry(conn,couName);
                                	break;
                                case 'C':
                                	workStudentInfo(conn);
                                	break;
                                case 'D':
                                	cDone = true;
                                	System.out.println("Returning to Graduate Student menu");
                                	break;
                                default:
                                	System.out.println("Invalid input. Please try again.");
                                	break;
                                }
                        	} while (!cDone);
                        	break;
                        	
                        //Grad Stud Info: Visa Status Menu
                        case '3':
                        	sDone = false;
                        	do {
                        		printVisaMenu();
                        		System.out.print("Enter your option: ");
                        		System.out.flush();
                                String vsch = readLine();
                                System.out.println();
                                System.out.println("*****************************************************************************");
                        		
                                switch (Character.toUpperCase(vsch.charAt(0))) {
                                case 'A':
                                	visaStatus(conn);
                                	break;
                                case 'B':
                                	j1Visa(conn);
                                	break;
                                case 'C':
                                	sDone = true;
                                	break;
                                default:
                                	System.out.println("Invalid input. Please try again.");
                                	break;
                                }
                        	} while(!sDone);
                        	break;
                        	
                        //Grad Stud Info: return to main menu
                        case '4':
                        	gDone = true;
                        	System.out.println("Returning to Main Menu");
                        	break;
                        	//quit to main menu
                        default:
                        	System.out.println("Invalid input. Please try again.");
                        	break;
                        }
                    	} while (!gDone);
                        break;
                        
                //Option 3: International Rules and Laws
                    case '3':
                    	doneSc3 = false;
                    	do {
                    		//prints menu header
                        	printRLMenu();
                    		System.out.print("Enter your option: ");
                    		System.out.flush();
                            String rlch = readLine();
                            System.out.println();
                            System.out.println("*****************************************************************************");
                            
                            switch (Character.toUpperCase(rlch.charAt(0))) {
                            case 'A':
                            	intRLList(conn);
                            	break;
                            case 'B':
                            	System.out.print("Enter an ID: ");
                            	System.out.flush();
                                String rlID = readLine();
                                System.out.println();
                                System.out.println("*****************************************************************************");
                                intRLDescription(conn, rlID);
                                break;
                            case 'C':
                            	doneSc3 = true;
                            	System.out.println("Returning to Main Menu");
                            	break;
                            default:
                            	System.out.println("Invalid input. Please try again.");
                            	break;
                            }
                    	} while(!doneSc3);
                     break;
                     
                //Option 4: Updates
                    case '4':
                    	admin = readEntry("\n\nEnter Administrator ID : ");
                        adminpass = readEntry("Enter password: ");
                        if (!admin.equals("admin") || !adminpass.equals("admin")) {
                            System.out.println("\n\nAccess Denied. Back to main menu\n\n");
                            done4=true;
                        } else {
                        	System.out.println("\n\nLogging in..\n\n");
                        	done4 = false;
                        }
                        
                        while(!done4) {
                        	printUpdateMenu();
                            System.out.print("Enter your option: ");
                            System.out.flush();
                            String ch4 = readLine();
                            System.out.println();
                            System.out.println("*****************************************************************************");
                            
                        switch (Character.toUpperCase(ch4.charAt(0))) {
                        case 'A': //Insert
                        	System.out.println("\n\nUnder construction...\n");
                        	break;
                        case 'B': //Delete
                        	printDeleteMenu();
                        	System.out.print("Enter your option: ");
                            System.out.flush();
                            String chD = readLine();
                            
                            System.out.println("*****************************************************************************");
                            doneD=false;
                            do {
                            	switch (Character.toUpperCase(chD.charAt(0))) {
                            	case 'A': //delete student info
                            		System.out.println("Which student info do you wish to delete?");
                            		System.out.println("A. Birthday - B. Gender - C. Address");
                                    System.out.flush();
                                    String infoDel = readLine();
                                    System.out.println("What student should be affected (give SSN)?");
                                    System.out.flush();
                                    String stud = readLine();
                                    if (!infoDel.matches("A|B|C")) {
                                    	System.out.println("Incorrect input");
                                    	break;
                                    }
                                    deleteStudentInfo(conn,stud,infoDel);
                                    if (infoDel.equals("A")) {
                                    	System.out.println("Birthday Deleted from Student Record");
                                    } else if (infoDel.equals("B")) {
                                    	System.out.println("Gender Deleted from Student Record");
                                    } else {
                                    	System.out.println("Address Deleted from Student Record");
                                    }
                                    doneD=true;
                                    System.out.println("Returning to Update Menu");
                                    break;
                            	case 'B': //delete course info
                            		System.out.println("Which course info do you wish to delete?");
                            		System.out.println("A. Credits - B. Department");
                                    System.out.flush();
                                    String courseDel = readLine();
                                    System.out.println("What course should be affected (give course id)?");
                                    System.out.flush();
                                    String course = readLine();
                                    if (!courseDel.matches("A|B")) {
                                    	System.out.println("Incorrect input");
                                    	break;
                                    }
                                    deleteCourseInfo(conn,course,courseDel);
                                    if (courseDel.equals("A")) {
                                    	System.out.println("Credits Deleted from Course Record");
                                    } else {
                                    	System.out.println("Department Deleted from Course Record");
                                    }
                                    doneD=true;
                                    System.out.println("Returning to Update Menu");
                                    break;
                            	case 'C': //delete department info
                            		System.out.println("Which Department info do you wish to delete?");
                            		System.out.println("A. Address - B. Department Head Name - C. Department Head Address");
                                    System.out.flush();
                                    String depDel = readLine();
                                    System.out.println("What course should be affected (give department id)?");
                                    System.out.flush();
                                    String dep = readLine();
                                    if (!depDel.matches("A|B|C")) {
                                    	System.out.println("Incorrect input");
                                    	break;
                                    }
                                    deleteDepInfo(conn,dep,depDel);
                                    if (depDel.equals("A") || depDel.equals("a")) {
                                    	System.out.println("Address Deleted from Department Record");
                                    } else if (depDel.equals("B") || depDel.equals("b")) {
                                    	System.out.println("Department Head Name Deleted from Department Record");
                                    } else {
                                    	System.out.println("Department Head Address Deleted from Department Record");
                                    }
                                    doneD=true;
                                    System.out.println("Returning to Update Menu");
                            		break;
                            	case 'D': //withdraw student from course
                            		System.out.println("Which Course is the student withdrawing from (enter course id)?");
                                    System.out.flush();
                                    String classDel = readLine();
                                    System.out.println("What student is withdrawing (enter student id)?");
                                    System.out.flush();
                                    String stu = readLine();
                                    deleteDepInfo(conn,stu,classDel);
                                    
                                    System.out.println("Student Withdrawn from Course-ID " + classDel);
                                    doneD=true;
                                    System.out.println("Returning to Update Menu");
                            		break;
                            	case 'E':	//quit
                            		doneD = true;
                            		break;
                            	default:
                                	System.out.println("Invalid input. Please try again.");
                                	break;
                            	}
                            } while (!doneD);
                        	break;
                        case 'C': //Update
                        	System.out.println("Under construction...");
                        	break;
                        case 'D': //Quit
                        	done4 = true;
                        	System.out.println("Back to main menu");
                        	break;
                        default:
                        	System.out.println("Invalid input. Please try again.");
                        	break;
                        }
                        } //while (!done4);
                     break;
                         
                        
                    case '5': 
                    	done = true;
                    	System.out.println("Quitting...\nBye!");
                        break;
                    default:
                    	System.out.println("\nInvalid input. Please try again.\n\n");
                    	break;
                } 
            } while (!done);


        } catch (ClassNotFoundException e) {
            System.out.println("Could not load the driver");
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {   
                    System.out.println(e);
                }
            }
        }
    }
	
	static String readEntry(String prompt) {
        try {
            StringBuffer buffer = new StringBuffer();
            System.out.print(prompt);
            System.out.flush();
            int c = System.in.read();
            while(c != '\n' && c != -1) {
                buffer.append((char)c);
                c = System.in.read();
            }
            return buffer.toString().trim();
        } catch (IOException e) {
            return "";
        }
    }

    private static String readLine() {
        InputStreamReader isr = new InputStreamReader(System.in);
        BufferedReader br = new BufferedReader(isr, 1);
        String line = "";

        try {
            line = br.readLine();
        } catch (IOException e) {
            System.out.println("Error in SimpleIO.readLine: " +
                    "IOException was thrown");
            System.exit(1);
        }
        return line;
    }

    
    
    //PRINT MENUS:
    
    //Prints Main Header
    private static void printHeader() {
    	
        System.out.println("\n*****************************************************************************");
        System.out.println("                                 ***********");
        System.out.println("                                Welcome to the");
        System.out.println("                  International Student Information System");
        System.out.println("                                 ***********");
        System.out.println("*****************************************************************************");
    }
    
    //Prints Main Menu
    
    private static void printMenu() {
    	System.out.println("*****************************************************************************");
        System.out.println();
        System.out.println("                                  MAIN MENU");
        System.out.println("*****************************************************************************");
        System.out.println("                            1. Current Students");
        System.out.println("                           2. Graduated Students");
        System.out.println("                      3. International Rules & Laws");
        System.out.println("                                 4. Update");
        System.out.println("                                  5. Quit");
        
    }
    
    //Prints Option 2: Grad Student Menu
    private static void printGradMenu() {
    	
        //printHeader();
        System.out.println("*****************************************************************************");
        System.out.println();
        System.out.println("                           2. Graduated Students");
        System.out.println("*****************************************************************************");
        System.out.println("                           1. Academic Information");
        System.out.println("                           2. Contact Information");
        System.out.println("                         3. Visa Status Information");
        System.out.println("                            4. Back to Main Menu");
        
    }

	//Prints Option 2-1: Grad Student: Academic Info Menu
	private static void printAcademicInfoMenu() {
		//printHeader();
		System.out.println("*****************************************************************************");
    	System.out.println();
    	System.out.println("                           1. Academic Information");
    	System.out.println("*****************************************************************************");
    	System.out.println("                      A. Education History for a Student");
    	System.out.println("                        B. College Students Information");
    	System.out.println("                                  C. Back");
	}

	//Prints Option 2-2: Grad Student: Contact Info Menu
	private static void printContactInfoMenu() {
		//printHeader();
    	System.out.println("*****************************************************************************");
    	System.out.println();
    	System.out.println("                           2. Contact Information");
    	System.out.println("*****************************************************************************");
    	System.out.println("                      A. All student contact details");
    	System.out.println("                        B. Students From a Country");
    	System.out.println("                    C. Working Students Contact Information");
    	System.out.println("                                  D. Back");   
	}

//Prints Option 2-3: Grad Student: Visa Status Menu
	private static void printVisaMenu() {
		//printHeader();
    	System.out.println("*****************************************************************************");
    	System.out.println();
    	System.out.println("                           3. Visa Status Information");
    	System.out.println("*****************************************************************************");
    	System.out.println("                             A. Visa Status Report");
    	System.out.println("                         B. All Students with J-1 Visas");
    	System.out.println("                                  C. Back");
	}

	//Prints Option 3: International Rules & Laws Menu
	private static void printRLMenu() {
		//printHeader();
		System.out.println("*****************************************************************************");
    	System.out.println();
    	System.out.println("                           3. International Rules & Laws");
    	System.out.println("*****************************************************************************");
    	System.out.println("                          A. See full list of Rules & Laws");
    	System.out.println("                    B. See more info about a specific Rule or Law");
    	System.out.println("                                C. Back to Main Menu");
	}

	//Prints Option 4: Updates Menu
	private static void printUpdateMenu() {
    	
		//printHeader();
		System.out.println("*****************************************************************************");
		System.out.println();
        System.out.println("                                 4. Update");
        System.out.println("*****************************************************************************");
        System.out.println("                            A. Insert Information");
        System.out.println("                           B. Delete Information");
        System.out.println("                       C. Update Current Information");
        System.out.println("                            D. Back to Main Menu");
        
        
    }

	//Prints Option 4-2: Delete Info Menu
	private static void printDeleteMenu() {
		//printHeader();
		System.out.println("*****************************************************************************");
		System.out.println();
        System.out.println("                               Delete Information");
        System.out.println("*****************************************************************************");
        System.out.println();
        System.out.println("                   A. Delete Specific Student Information");
        System.out.println("                    B. Delete Specific Course Information");
        System.out.println("                      C. Delete Department Information");
        System.out.println("                     D. Withdraw a Student From a Course");
        System.out.println("                            E. Back to Update Menu");
    
}

	
	
//OPTION 2:
	
// Scenario 2-1a: returns educational history for a given student
private static void edHis(Connection conn, String ssn) throws SQLException, IOException { //prompt for the social security number of a student and returns that student�s educational history (the name of the schools attended, degree earned, GPA, etc.)
	Statement stmt = conn.createStatement();
	String query = "SELECT C.Col_Name, E.GPA, E.Enroll_Date FROM College as C, Educational_History as E WHERE E.Student_SSN=" + ssn + " AND E.College_ID=C.College_ID";
	ResultSet rset = stmt.executeQuery(query);
	
	while (rset.next())
    {
		String cName = rset.getString(1);
    	String GPA = rset.getString(2);
    	String eDate = rset.getString(3);
    	System.out.println("College Name: " + cName + " GPA: " + GPA + " Enrollment Date: " + eDate);
    }
	
	//Close the statement
    stmt.close();
	
}

// Scenario 2-1b: returns list of SSNs and names of students enrolled in a given college
private static void cStuInfo(Connection conn, String college) throws SQLException, IOException {
	Statement stmt = conn.createStatement();
	String query = "SELECT S.St_Name, S.Student_SSN FROM College as C, Grad as G, Student as S WHERE S.Student_SSN=G.G_SSN AND C.Col_Name=\"" + college + "\" AND C.College_ID=G.College_ID";
	
	ResultSet rset = stmt.executeQuery(query);
	
	while (rset.next())
    {
		String sName = rset.getString(1);
		String SSN = rset.getString(2);
    	System.out.println("Student Name: " + sName + " SSN: " + SSN);
    }
	
	//Close the statement
    stmt.close();
}

// Scenario 2-2a: returns info about all grad students
private static void allContactInfo(Connection conn) throws SQLException, IOException { // It should return the list of the social security number name, address, major department, and college for all the international graduate students.
	Statement stmt = conn.createStatement();
	String query = "SELECT S.Student_SSN, S.St_Name, S.St_Addr, D.Dep_Name, C.Col_Name FROM Grad as G, Student as S, College as C, Department as D WHERE G.G_SSN=S.Student_SSN AND C.College_ID=G.College_ID AND D.Department_ID=S.Dep_Major";
	
	ResultSet rset = stmt.executeQuery(query);
	
	while (rset.next())
    {
  	  
  	  String SSN = rset.getString(1);
    	String sName = rset.getString(2);
    	String sAddr = rset.getString(3);
    	String dName = rset.getString(4);
    	String cName = rset.getString(5);
    	System.out.println("SSN: " + SSN + " Student Name: " + sName + " Address: " + sAddr + " Major Department: " + dName + " College Name: " + cName);
    	
    }
	
	//Close the statement
    stmt.close();
}

// Scenario 2-2b: returns student info for all students from a given country
private static void fromCountry(Connection conn, String country) throws SQLException, IOException {
	Statement stmt = conn.createStatement();
	String query = "SELECT S.Student_SSN, S.St_Name, S.St_Addr FROM Student as S, St_From_Country as C WHERE C.Country_Name=\"" + country + "\" AND S.Student_SSN=C.Student_SSN";
	
	ResultSet rset = stmt.executeQuery(query);
	
	while (rset.next())
    {
  	  
  	  String SSN = rset.getString(1);
    	String sName = rset.getString(2);
    	String sAddr = rset.getString(3);
    	
    	System.out.println("SSN: " + SSN + " Student Name: " + sName + " Address: " + sAddr);
    	
    }
	
	//Close the statement
    stmt.close();
}

// Scenario 2-2c, returns contact and job hr/week info for all students who are working
private static void workStudentInfo(Connection conn) throws SQLException, IOException {
	
	// defines a string that contains the SQL query
	String query = 
    		"SELECT s.Student_SSN \"SSN\", s.St_Name \"Name\", s.St_Addr \"Address\", sum(j.Job_Hours_Week) \"Job Hrs/Week\" " +
    		"FROM Student_Has_Job sj " +
    		"JOIN JOB j ON j.Job_Name = sj.Job_Name " +
    		"JOIN Student s ON sj.Student_SSN = s.Student_SSN " +
    		"WHERE  s.Student_SSN IN (SELECT g.G_SSN FROM Grad g) " +
    		"GROUP BY s.Student_SSN " +
    		"ORDER BY s.Student_SSN;";
    
    PreparedStatement p = conn.prepareStatement (query);
    
    // Declares a variable with ResultSet type
    ResultSet rset = p.executeQuery();
    
    
    // prints header
    System.out.println("\n              Working Students Contact Info:");
    System.out.println("------------------------------------------------------------\n");
    System.out.format("%-12s%-30s%-62s%-5s", "SSN","Name","Address","Job","Hrs/Week");
    System.out.println();

    // Write a loop to read and print all the returned rows from the query execution
    String ssn, name, addr;
    int hrs;
    while (rset.next ()) {
    	ssn = rset.getString(1);
    	name = rset.getString(2);
    	addr = rset.getString(3);
    	hrs = rset.getInt(4);
    	System.out.format("%-12s%-30s%-62s%-5d", ssn, name, addr, hrs);
    	System.out.println();
    }

    // Closes the statement
    p.close();
}


//Scenario 2-3: Prints visa status details of all grad students
private static void visaStatus(Connection conn) throws SQLException, IOException {
	String query = "SELECT s.St_Name, gv.G_SSN, v.Visa_Name, gv.Start_Date, gv.Expiration " + 
			"FROM GradVisa_Has_GradStudent gv " + 
			"JOIN Graduate_Visa v ON gv.Visa_ID = v.Visa_ID " + 
			"JOIN Student s ON gv.G_SSN = s.Student_SSN " + 
			"ORDER BY s.St_Name, gv.Start_Date DESC;";
	PreparedStatement p = conn.prepareStatement (query);
	
	System.out.println("\n                  Visa Status of Grads: ");
	System.out.println("-----------------------------------------------------------------");
  System.out.format("%-30s%-12s%-7s%-20s%-20s", "Name", "SSN", "Visa", "Visa Start", "Visa Expiration");
  System.out.println();
	// Declares a variable with ResultSet type
  ResultSet rset = p.executeQuery();
  
  // Write a loop to read and print all the returned rows from the query execution
  String name, ssn, visa;
  Date start, exp;
  while (rset.next ()) {
  	name = rset.getString(1);
  	ssn = rset.getString(2);
  	visa = rset.getString(3);
  	start = rset.getDate(4);
  	exp = rset.getDate(5);
  	System.out.format("%-30s%-12s%-7s%-20s%-20s", name, ssn, visa, start, exp);
  	System.out.println();
  }
}

//Scenario 2-3: Prints all grad student with J-1 visas
private static void j1Visa(Connection conn) throws SQLException, IOException {
	String query = "SELECT g.G_SSN, s.St_Name, sfc.Country_Name " + 
			"FROM Grad g " + 
			"JOIN Student s ON g.G_SSN = s.Student_SSN " + 
			"JOIN St_From_Country sfc ON sfc.Student_SSN = s.Student_SSN " + 
			"WHERE g.Visa_ID IN (SELECT Visa_ID FROM Graduate_Visa WHERE Visa_Name = \"J-1\") " + 
			"ORDER BY g.G_SSN;";
	PreparedStatement p = conn.prepareStatement (query);
	
	// Declares a variable with ResultSet type
  ResultSet rset = p.executeQuery();
  
  System.out.println("\n                 Students with J-1 Visas:");
  System.out.println("-----------------------------------------------------------------");
  System.out.format("%-12s%-30s%-30s", "SSN", "Name", "Country");
  System.out.println();
  // Write a loop to read and print all the returned rows from the query execution
  String name, ssn, cntry;
  while (rset.next ()) {
  	ssn = rset.getString(1);
  	name = rset.getString(2);
  	cntry = rset.getString(3);
  	System.out.format("%-12s%-30s%-30s", ssn, name, cntry);
  	System.out.println();
  }
}




//OPTION 3:

//Scenario 3a: Prints all rule IDs and Names
private static void intRLList(Connection conn) throws SQLException, IOException {
	String query = "SELECT RL_ID, RL_Name " + 
			"FROM Regulations_and_Laws rl " + 
			"ORDER BY RL_ID;" ;
	PreparedStatement p = conn.prepareStatement (query);
	
	// Declares a variable with ResultSet type
    ResultSet rset = p.executeQuery();
    
    System.out.println("\n        List of all International Rules and Regulations: ");
    System.out.println("-----------------------------------------------------------------");
    System.out.format("%-5s%-45s", "ID","Name");
    System.out.println();
    // Write a loop to read and print all the returned rows from the query execution
    String name;
    int id;
    while (rset.next ()) {
    	id = rset.getInt(1);
    	name = rset.getString(2);
    	System.out.format("%-5d%-45s", id,name);
    	System.out.println();
    }
}

//Scenario 3b: Prints given rule name and description
private static void intRLDescription(Connection conn, String rlID) throws SQLException, IOException {
	String query = "SELECT RL_Name, RL_Description " + 
			"FROM Regulations_and_Laws " + 
			"WHERE RL_ID = " + rlID + ";";
	PreparedStatement p = conn.prepareStatement (query);
	
	// Declares a variable with ResultSet type
    ResultSet rset = p.executeQuery();
    
    System.out.println("\n                 Rule name and description: ");
    System.out.println("-----------------------------------------------------------------");
    System.out.println();
    // Write a loop to read and print all the returned rows from the query execution
    String name, desc;
    while (rset.next ()) {
    	name = rset.getString(1);
    	desc = rset.getString(2);
    	System.out.println("Name: " + name + ", Description: " + desc);
    	System.out.println("\n");
    }
}




//OPTION 4:

//Option 4-2a: Deletes specific student info
private static void deleteStudentInfo(Connection conn, String info,String type) throws SQLException, IOException
{
	Statement stmt = conn.createStatement();
	String query;
	if (type.equals("A") || type.equals("a")) {
		query = "UPDATE Student SET St_Birthday = NULL WHERE Student_SSN=" + info + ";";
	} else if (type.equals("B") || type.equals("b")) {
		query = "UPDATE Student SET St_Gender = NULL WHERE Student_SSN=" + info + ";";
	} else {
		query = "UPDATE Student SET St_Addr = NULL WHERE Student_SSN=" + info + ";";
	}
	
  stmt.executeUpdate(query);
  
  
//Close the statement
  stmt.close(); 
}

//Option 4-2b: Deletes specific course info
private static void deleteCourseInfo(Connection conn, String info, String type) throws SQLException, IOException
{
	Statement stmt = conn.createStatement();
	String query;
	if (type.equals("A") || type.equals("a")) {
		query = "UPDATE Course SET Course_Credits = NULL WHERE Course_ID=" + info + ";";
	} else {
		query = "UPDATE Course SET Department_ID = NULL WHERE Course_ID=" + info + ";";
	}
   
  stmt.executeUpdate(query);
  
  
//Close the statement
  stmt.close(); 
}

//Option 4-2c: Deletes department info
private static void deleteDepInfo(Connection conn, String info, String type) throws SQLException, IOException
{
	Statement stmt = conn.createStatement();
	String query;
	if (type.contentEquals("A") || type.contentEquals("a")) {
		query = "UPDATE Department SET Dep_Addr = NULL WHERE Department_ID=" + info + ";";
	} else if (type.contentEquals("B") || type.contentEquals("b")) {
		query = "UPDATE Department SET Head_Name = NULL WHERE Department_ID=" + info + ";";
	} else {
		query = "UPDATE Department SET Head_Addr = NULL WHERE Department_ID=" + info + ";";
	}
   
  stmt.executeUpdate(query);

//Close the statement
  stmt.close(); 
}

}
