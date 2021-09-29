import com.ibm.db2.jcc.DB2Driver;

import javax.swing.text.Style;
import java.awt.desktop.SystemSleepEvent;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Scanner;

public class VaccineApp {
    public static void main(String[] args) throws SQLException {
        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode = 0;      // Variable to hold SQLCODE
        String sqlState = "00000";  // Variable to hold SQLSTATE

        if (args.length > 0)
            tableName += args[0];
        else
            tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try {
            DriverManager.registerDriver(new DB2Driver());
        } catch (Exception cnfe) {
            System.out.println("Class not found");
        }

        // This is the url you must use for DB2.
        //Note: This url may not valid now !
        String url = "jdbc:db2://winter2021-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = "";
        String your_password = "";
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if (your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if (your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection(url, your_userid, your_password);
        Statement statement = con.createStatement();
        // Inserting Data into the table
        try {
            Scanner scanner = new Scanner(System.in);
            while (true) {
                try {
                    //recursively print out the menu to user.
                    System.out.println("VaccineApp Main Menu\n 1. Add a Person \n 2. Assign a slot to a person \n 3. Enter Vaccination information \n 4.Exit Application");
                    System.out.println("Please enter an option");
                    String line = scanner.nextLine();
                    int a = Integer.valueOf(line);
                    //invalid option
                    if (a <= 0 || a > 4) {
                        System.out.println("invalid option. Please enter 1/2/3/4");
                        continue;
                    }
                    //add a person
                    if (a == 1) {
                        System.out.println("Please enter an HIN");
                        String HIN = scanner.nextLine();
                        if (HIN == null || HIN == " ") {
                            System.out.println("Please enter a valid pid");
                            continue;
                        } else {
                            String sql = "SELECT * FROM Person WHERE HIN=\'" + HIN+"\'";
                            ResultSet rs = statement.executeQuery(sql);
                            if (rs.next()) {
                                System.out.println("user already exist");
                                System.out.println("Are you willing to change attribute? Y/N");
                                String change = scanner.nextLine();
                                if (change.equals("N")){
                                    continue;
                                }else{
                                    //the program interpret that user wants to update unless user typed in "N"
                                    boolean update = true;
                                    while (update){
                                        System.out.println("Enter which information to update:");
                                        System.out.println("Please enter one of the following attributes:");
                                        System.out.println("name\tdateOfBirth\tgender\tphone\tcname\tregDate\tcity\tstreetAddress\tpostalcd");
                                        String updateCol = scanner.nextLine();
                                        System.out.println("Enter the value you want to update to");
                                        String updateTo = scanner.nextLine();
                                        HashSet<String> set = new HashSet<>();
                                        set.add("name");
                                        set.add("dateOfBirth");
                                        set.add("gender");
                                        set.add("phone");
                                        set.add("cname");
                                        set.add("regDate");
                                        set.add("city");
                                        set.add("streetAddress");
                                        set.add("postalcd");
                                        if (!set.contains(updateCol)){
                                            System.out.println("Please enter a valid column name");
                                            break;
                                        }else{
                                            String updateSQL = "UPDATE Person SET " +updateCol+"= \'"+updateTo+"\'"+"WHERE HIN = \'"+HIN+"\'";
                                            System.out.println(updateSQL);
                                            statement.executeUpdate(updateSQL);
                                            System.out.println("Do you want to continue update ? Y/N");
                                            String continute = scanner.nextLine();
                                            if (continute.equals("N")){
                                                break;
                                            }else{
                                                continue;
                                            }
                                        }
                                    }

                                }
                            } else {
                                System.out.println("Please enter name");
                                String name = scanner.nextLine();
                                System.out.println("Please enter date of birth format : yyyy-mm-dd");
                                String bDate = scanner.nextLine();
                                System.out.println("Please enter gender: F for female, M for male");
                                String gender = scanner.nextLine();
                                System.out.println("Please enter phone number");
                                String phone = scanner.nextLine();
                                System.out.println("Please indicate the category name you belong to ");
                                String cname = scanner.nextLine();
                                String regdate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
                                System.out.println("Please enter city name");
                                String city = scanner.nextLine();
                                System.out.println("Please enter street address");
                                String streetA = scanner.nextLine();
                                System.out.println("Please enter postal code");
                                String pc = scanner.nextLine();
                                String insertsql = "INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES (\'" + HIN + "\', \'" + name + "\', \'" + bDate + "\', \'" + gender + "\', \'" + phone + "\', \'" + cname + "\', \'" + regdate + "\', \'" + city + "\', \'" + streetA + "\', \'" + pc+"\')";
                                //System.out.println(insertsql);
                                statement.executeUpdate(insertsql);
                                //System.out.println(insertsql);
                            }
                        }
                    }
                    //terminate all sessions.
                    if (a== 4){
                        statement.close();
                        con.close();
                        System.out.println("Session terminated");
                        break;
                    }
                    //assign a slot
                    if (a == 2){
                        System.out.println("Enter person's HIN");
                        String hin = scanner.nextLine();
                        String sql = "SELECT * FROM Person WHERE HIN= \'" + hin+"\'";
                        ResultSet rs = statement.executeQuery(sql);
                        if (rs.next()) {
                            String allSlot = "SELECT vtime, vslot, vacdate, lname FROM Slot";
                            ArrayList<String> allslots = new ArrayList<>();
                            ResultSet alls = statement.executeQuery(allSlot);
                            int allslotIndex = 0;
                            //print out all available slots
                            while (alls.next()) {
                                allslotIndex++;
                                allslots.add(alls.getString(1).trim() + " " + alls.getString(2).trim() + " " + alls.getString(3).trim() + " " + alls.getString(4).trim());
                                System.out.println(allslotIndex + ": " + alls.getString(1).trim() + " " + alls.getString(2).trim() + " " + alls.getString(3).trim() + " " + alls.getString(4).trim());
                            }
                            System.out.println("Choose in above List of slots:");
                            String selectFromAll = allslots.get(Integer.valueOf(scanner.nextLine()) - 1);
                            String checkNum = "SELECT COUNT(*)  FROM PersonAllocation  WHERE HIN = \'" + hin + "\'";
                            String vname = "";
                            ResultSet check = statement.executeQuery(checkNum);
                            //System.out.println(checkNum);
                            int numberInjected = 0;
                            if (check.next()) {
                                numberInjected = check.getInt(1);
                            }
                            System.out.println("This person has injected " + numberInjected + " number of doses");
                            //if the person has rejected vaccine before
                            if (numberInjected > 0) {
                                String checkNum2 = "SELECT Vaccine.numdoses FROM PersonAllocation, Vail, batchStorage, Vaccine WHERE PersonAllocation.vtime = Vail.vtime and PersonAllocation.vslot = Vail.vslot and PersonAllocation.vacdate = Vail.vacdate and PersonAllocation.lname = Vail.lname and Vail.bnumber = batchStorage.bnumber and batchStorage.vname = Vaccine.vname";
                                System.out.println(checkNum2);
                                ResultSet check2 = statement.executeQuery(checkNum2);
                                int numberReq = 0;
                                if (check2.next()) {
                                    numberReq = check2.getInt(1);
                                } else {
                                    System.out.println("No vaccine available at this time");
                                }
                                if (numberInjected >= numberReq) {
                                    //Person has already injected all required number of vaccine
                                    System.out.println("Unable to assign a slot");
                                    continue;
                                }
                            }
                            String date = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
                            //System.out.println("Please choose following slot");
                            String numslot = "SELECT vtime, vslot, vacdate, lname FROM Slot WHERE" + "(vtime, vslot) not in (" +
                                    "SELECT Slot.vtime, Slot.vslot FROM Slot, PersonAllocation WHERE Slot.vtime = PersonAllocation.vtime and Slot.vslot = PersonAllocation.vslot )" +
                                    " and vacdate > \'" + date + "\'";
                            //System.out.println(numslot);
                            rs = statement.executeQuery(numslot);
                            ArrayList<String> slots = new ArrayList<>();
                            int index = 0;
                            while (rs.next()) {
                                index++;
                                String vtime = rs.getString(1);
                                String vslot = rs.getString(2);
                                String vacdate = rs.getString(3);
                                String lname = rs.getString(4);
                                String slot = vtime.trim() + " " + vslot.trim() + " " + vacdate.trim() + " " + lname.trim();
                                //System.out.println(index+ ": " + slot);
                                slots.add(slot);
                            }
                            String chosenSlot = "";
                            if (slots.contains(selectFromAll)) {
                                chosenSlot = selectFromAll;
                            } else {
                                //the user typed in a slot that is not available
                                System.out.println("The slot you selected can not be assigned,");
                                System.out.println("You have to choose among following slots ");
                                int slotin = 0;
                                for (int i = 0; i<slots.size(); i++ ){
                                    slotin++;
                                    System.out.println(slotin+": "+slots.get(i));
                                }
                                chosenSlot = scanner.nextLine();
                                int chosen = Integer.parseInt(chosenSlot);
                                if (chosen < 1 || chosen > slots.size()) {
                                    //typing error
                                    System.out.println("Invalid attempt");
                                    continue;
                                } else {
                                    chosenSlot = slots.get(chosen - 1);
                                }
                            }
                            System.out.println(chosenSlot);
                            String[] chosens = chosenSlot.split(" ");
                            String chosenVtime = chosens[0];
                            String chosenVslot = chosens[1];
                            int offset = 0;
                            while (chosens[offset + 1] == " ") offset++;
                            String chosenVacdate = chosens[offset + 2];
                            String chosenLoc = "";
                            for (int i = offset + 3; i < chosens.length; i++) {
                                chosenLoc += chosens[i] + " ";
                            }
                            System.out.println(chosenLoc);
                            //String chosenLoc = chosens[offset+3]+" "+chosens[offset+4];
                            String asgn = "INSERT INTO PersonAllocation (alloc_date, HIN, vslot, vtime, vacdate, lname)VALUES ( \'" + date + "\' , \'" + hin + "\' , \'" + chosenVslot + "\' , \'" + chosenVtime + "\' , \'" + chosenVacdate + "\' , \'" + chosenLoc.trim() + "\')";
                            //System.out.println(asgn);
                            statement.executeUpdate(asgn);
                            //System.out.println(asgn);
                        } else{
                            //user does not exist
                            System.out.println("The user does not exist, please enter valid HIN");
                            continue;
                        }
                    }
                    //enter vaccine information
                    //assume user enter all information at once
                    if (a==3){
                        System.out.println("Enter vaccination information");
                        System.out.println("Please enter person HIN");
                        String personHIN = scanner.nextLine();
                        String getAsgn = "SELECT COUNT (*) FROM personAllocation, Slot, Vail WHERE " +
                                "personAllocation.HIN = \'"+personHIN+"\' and personAllocation.vtime = Slot.vtime and personAllocation.vslot = Slot.vslot and Vail.vslot = Slot.vslot and Vail.vtime = Slot.vtime and Vail.vacdate = Slot.vacdate and Vail.lname = Slot.lname"
                                ;
                        //System.out.println(getAsgn);
                        ResultSet rshin = statement.executeQuery(getAsgn);
                        String vname = "";
                        if (rshin.next() && rshin.getInt(1)!=0){
                            System.out.println("This person has injected vaccination before");
                            int entered = rshin.getInt(1);
                            String printAvailables = "SELECT Vail.vname FROM personAllocation, Slot, Vail WHERE " +
                                    "personAllocation.HIN = \'"+personHIN+"\' and personAllocation.vtime = Slot.vtime and personAllocation.vslot = Slot.vslot and Vail.vslot = Slot.vslot and Vail.vtime = Slot.vtime and Vail.vacdate = Slot.vacdate and Vail.lname = Slot.lname"
                                    ;

                            ResultSet rsAvailable = statement.executeQuery(printAvailables);
                            if (rsAvailable.next()){
                                vname = rsAvailable.getString(1);
                                String allDoses = "SELECT numdoses FROM Vaccine WHERE vname = \'"+vname+"\'";
                                ResultSet rsdoses = statement.executeQuery(allDoses);
                                int required = 0;
                                if (rsdoses.next()){
                                    required = rsdoses.getInt(1);
                                }
                                if (required <= entered){
                                    //no information needed
                                    System.out.println("All information has been entered");
                                    continue;
                                }
                                //indicate the type of vaccine user needs to inject
                                System.out.println("Please inject" + vname);
                            }
                        }
                        String availables = "SELECT Slot.vtime, Slot.vslot, Slot.vacdate, Slot.lname FROM personAllocation, Slot WHERE (Slot.vslot, Slot.vacdate, Slot.vtime, Slot.lname) not in ( SELECT Slot.vslot, Slot.vacdate, Slot.vtime, Slot.lname from Slot, Vail where  Vail.vslot = Slot.vslot and Vail.vtime = Slot.vtime and Vail.vacdate = Slot.vacdate and Vail.lname = Slot.lname ) and personAllocation.HIN = \'"+personHIN+"\' and PersonAllocation.vtime = Slot.vtime and PersonAllocation.vslot = Slot.vslot";
                        //System.out.println(availables);
                        ResultSet rsAll = statement.executeQuery(availables);
                        ArrayList<String> allavailables = new ArrayList<>();
                        int slotIndex = 0;
                        if (!rsAll.next()){
                            System.out.println("No slot available for this person");
                            continue;
                        }
                        ResultSet rsAll2 = statement.executeQuery(availables);
                        while (rsAll2.next()){
                            slotIndex++;
                            String infor = rsAll2.getString(1).trim()+" "+rsAll2.getString(2).trim()+" "+rsAll2.getString(3).trim()+ " "+rsAll2.getString(4).trim();
                            allavailables.add(infor);
                            System.out.println(slotIndex+": "+infor);
                        }
                        System.out.println("Please select a slot: ");
                        String index = scanner.nextLine();
                        String chose = allavailables.get(Integer.valueOf(index)-1);
                        System.out.println("List of available nurse NIN:");
                        String allNurses ="SELECT * FROM Nurse";
                        ResultSet allN = statement.executeQuery(allNurses);
                        ArrayList<String> allNurse = new ArrayList<>();
                        int nindex = 0;
                        while (allN.next()){
                            nindex ++;
                            System.out.println(nindex+": "+allN.getString(1));
                            allNurse.add(allN.getString(1).trim());
                        }
                        System.out.println("Please select a nurse");
                        String selectedNurse = allNurse.get(Integer.valueOf(scanner.nextLine())-1);
                        String checkNurse = "SELECT COUNT(*) FROM Nurse WHERE NLN =\'" + selectedNurse+"\'";
                        //System.out.println(checkNurse);
                        ResultSet check = statement.executeQuery ( checkNurse ) ;
                        String chosenloc="";
                        String chosendate="";
                        if (!check.next()||check.getInt(1)==0){
                            System.out.println("Nurse does not exit");
                            continue;
                        }else{
                            chosendate = chose.split(" ")[2];
                            if (chose.split(" ").length>= 4){
                                for (int i = 3; i<chose.split(" ").length; i++){
                                    chosenloc += " "+chose.split(" ")[i];
                                }
                            }
                            chosenloc = chosenloc.trim();
                            String nurseA ="SELECT * FROM nurseAssignments WHERE NLN =\'" + selectedNurse+"\' and vacdate = \'"+chosendate+"\' and lname = \'"+chosenloc+"\'";
                            //System.out.println(nurseA);
                            ResultSet nurseE  = statement.executeQuery(nurseA);
                            if (nurseE.next()){
                                System.out.println("Nurse already assigned!");
                                continue;
                            }
                        }
                        ArrayList<String> batchinfo = new ArrayList<>();
                        String allbatches = "SELECT VaccineBatch.bnumber, VaccineBatch.vname FROM batchStorage, VaccineBatch, VaccineLocation WHERE batchStorage.bnumber = VaccineBatch.bnumber and batchStorage.vname = VaccineBatch.vname and batchStorage.lname = VaccineLocation.lname";

                        ResultSet allbat = statement.executeQuery(allbatches);
                        int batchIndex = 0;
                        while (allbat.next()){
                            batchIndex++;
                            String b = allbat.getString(1).trim()+" "+ allbat.getString(2).trim();
                            batchinfo.add(b);
                            System.out.println(batchIndex+": "+b);
                        }
                        System.out.println("Please choose a batch");
                        int bindex = Integer.valueOf(scanner.nextLine());
                        String chosenb = batchinfo.get(bindex-1);
                        String chosenbnum = chosenb.split(" ")[0];
                        String chosenvname = chosenb.split(" ")[1];
                        //System.out.println(chosenvname +"vs"+ vname.trim());
                        //System.out.println(chosenvname.equalsIgnoreCase(vname.trim()));
                        boolean selectedVname = true;
                        while (selectedVname){
                            if (vname != "" && !chosenvname.equalsIgnoreCase(vname.trim())){
                                System.out.println("Invalid vname");
                                System.out.println("Please choose a batch with valid vaccine name");
                                bindex = Integer.valueOf(scanner.nextLine());
                                chosenb = batchinfo.get(bindex-1);
                                chosenbnum = chosenb.split(" ")[0];
                                chosenvname = chosenb.split(" ")[1];
                            }else{
                                selectedVname = false;
                            }
                        }
                        System.out.println("Please enter vail number");
                        String vnum = scanner.nextLine();
                        String checkvail = "SELECT * FROM Vail WHERE vnum = \'"+vnum+"\' and bnumber = \'"+chosenbnum+"\' and vname = \'"+chosenvname+"\'";
                        ResultSet checkV = statement.executeQuery(checkvail);
                        boolean newVail = true;
                        while (newVail){
                            if (checkV.next()){
                                System.out.println("Vail info already enter");
                                System.out.println("Please enter a new vail number");
                                vnum = scanner.nextLine();
                                checkvail = "SELECT * FROM Vail WHERE vnum = \'"+vnum+"\' and bnumber = \'"+chosenbnum+"\' and vname = \'"+chosenvname+"\'";
                                checkV = statement.executeQuery(checkvail);
                                continue;
                            }else{
                                newVail = false;
                                //success: create nurse assignment and vail information
                                String nurseAsgn = "INSERT INTO NurseAssignments (NLN, vacdate, lname) VALUES (\'"+selectedNurse+"\', \'"+chosendate+"\', \'"+chosenloc+"\')";
                                //System.out.println(nurseAsgn);
                                statement.executeUpdate(nurseAsgn);
                                String insertV = "INSERT INTO Vail (vnum, bnumber, vname, vslot, vtime, vacdate, lname) VALUES (\'"+vnum+"\', \'"+chosenbnum+"\', \'"+chosenvname+"\', \'"+chose.split(" ")[1]+"\', \'"+chose.split(" ")[0]+"\', \'"+chose.split(" ")[2]+"\', \'"+chosenloc+"\')";
                                //System.out.println(insertV);
                                statement.executeUpdate(insertV);
                            }
                        }
                    }
                } catch (SQLException e) {
                    sqlCode = e.getErrorCode(); // Get SQLCODE
                    sqlState = e.getSQLState(); // Get SQLSTATE
                    // Your code to handle errors comes here;
                    // something more meaningful than a print would be good
                    System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                    System.out.println(e);
                    break;
                }
            }
            statement.close();
            con.close();

        } catch (SQLException e) {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
            statement.close();
            con.close();
        }
    }
}
