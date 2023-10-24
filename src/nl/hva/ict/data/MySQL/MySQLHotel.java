package nl.hva.ict.data.MySQL;

import nl.hva.ict.models.Hotel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Dao voor hotels
 *
 * @author HBO-ICT
 */
public class MySQLHotel extends MySQL<Hotel> {

    private final List<Hotel> hotels;

    /**
     * Constructor
     */
    public MySQLHotel() {

        // init arraylist
        hotels = new ArrayList<>();

        // Laad bij startup
        load();
    }

    /**
     * Doe dit bij het maken van dit object
     */
    private void load() {

        // Voer hier je SQL code in
        String sql = """
                SELECT
                    a.code,
                    a.naam,
                    a.stad,
                    a.land,
                    a.kamer,
                    a.personen,
                    h.prijs_per_nacht as prijsPerNacht,
                    h.ontbijt
                FROM
                    accommodatie AS a
                INNER JOIN hotel AS h
                    ON a.code = h.accommodatie_code;
                """;

        try {
            // Roep de methode aan in de parent class en geen je SQL door
            PreparedStatement ps = getStatement(sql);

            //Voer je query uit en stop het antwoord in een result set
            ResultSet rs = executeSelectPreparedStatement(ps);

            // Loop net zolang als er records zijn
            while (rs.next()) {
                String accommodatieCode = rs.getString("code");
                String naam = rs.getString("naam");
                String stad = rs.getString("stad");
                String land = rs.getString("land");
                String kamer = rs.getString("kamer");
                int personen = rs.getInt("personen");
                double prijsPerNacht = rs.getDouble("prijsPerNacht");
                boolean ontbijt = rs.getBoolean("ontbijt");
                // Maak model aan en voeg toe aan arraylist
                hotels.add(new Hotel(accommodatieCode, naam, stad, land, kamer, personen, prijsPerNacht, ontbijt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    /**
     * Geen alle hotels in de arraylist terug
     *
     * @return arraylist met hotels
     */
    @Override
    public List<Hotel> getAll() {
        return hotels;
    }

    /**
     * Haal 1 hotel op
     *
     * @return hotel object
     */
    @Override
    public Hotel get() {
        return null;
    }

    /**
     * Voer een hotel toe
     *
     * @param hotel hotel
     */
    @Override
    public void add(Hotel hotel) {
    }

    /**
     * Update ene hotel
     *
     * @param hotel hotel
     */
    @Override
    public void update(Hotel hotel) {

    }

    /**
     * Verwijder een hotel
     *
     * @param object het hotel
     */
    @Override
    public void remove(Hotel object) {
        String sql = """
                CALL verwijderAccommodatie(?);
                """;
        try {
            PreparedStatement ps = getStatement(sql);
            ps.setString(1, object.getAccommodatieCode());
            ResultSet rs = executeSelectPreparedStatement(ps);
            System.out.println(rs);
            if (rs.toString().contains("0")) {
                System.out.println("Accommodatie niet verwijderd");
            } else {
                hotels.remove(object);
                System.out.println("Accommodatie verwijderd");
            }
            reload();
        } catch (SQLException e) {
            System.out.println("Er is iets fout gegaan bij het verwijderen van de accommodatie");
            e.printStackTrace();
        }
    }


    /**
     * Refresh het scherm
     */
    public void reload() {
        // Leeg arraylist
        hotels.clear();

        // Laad de data weer opnieuw
        load();
    }
}
