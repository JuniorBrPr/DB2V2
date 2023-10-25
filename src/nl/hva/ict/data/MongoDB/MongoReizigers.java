package nl.hva.ict.data.MongoDB;

import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Updates;
import nl.hva.ict.MainApplication;
import nl.hva.ict.models.Reiziger;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;

/**
 * Haal alle reizigers van Big Five Safari op uit de NoSQL database
 */
public class MongoReizigers extends MongoDB {

    private final List<Reiziger> reizigers;

    /**
     * Construtor
     */
    public MongoReizigers() {

        // init de arraylist
        reizigers = new ArrayList<>();

        // startup methode
        load();
    }

    /**
     * Haal alle objecten op. Niet gebruikt in deze class maar door de interface data wel verplicht
     *
     * @return een lijst
     */
    @Override
    public List<Reiziger> getAll() {
        return reizigers;
    }

    /**
     * Haal 1 object op. Niet gebruikt in deze class maar door de interface data wel verplicht
     *
     * @return een object
     */
    @Override
    public Object get() {
        return null;
    }

    /**
     * Voeg een object toe aan de arraylist. Niet gebruikt in deze class maar door de interface data wel verplicht
     */
    @Override
    public void add(Object object) {
        if (object instanceof Reiziger reiziger){
            this.collection.insertOne(reiziger.toDocument());
        }
    }


    /**
     * Update een object toe aan de arraylist. Niet gebruikt in deze class maar door de interface data wel verplicht
     */
    @Override
    public void update(Object object) {
        if (object instanceof Reiziger reiziger){
            this.collection.updateOne(
                    new Document("code", reiziger.getCode()),
                    Updates.combine(
                            Updates.set("code", reiziger.getCode()),
                            Updates.set("voornaam", reiziger.getVoornaam()),
                            Updates.set("achternaam", reiziger.getAchternaam()),
                            Updates.set("adres", reiziger.getAdres()),
                            Updates.set("postcode", reiziger.getPostcode()),
                            Updates.set("plaats", reiziger.getPlaats()),
                            Updates.set("land", reiziger.getLand()),
                            Updates.set("hoofdreiziger", reiziger.getHoofdreiziger())
                    )
            );
        }
    }

    /**
     * Update een object toe aan de arraylist. Niet gebruikt in deze class maar door de interface data wel verplicht
     */
    @Override
    public void remove(Object object) {
        if (object instanceof Reiziger reiziger){
            this.collection.deleteOne(new Document("code", reiziger.getCode()));
        }
    }

    /**
     * Laad bij startup
     */
    public void load() {
        if (MainApplication.getNosqlHost().isEmpty())
            return;

        this.reizigers.clear();

        this.selectedCollection("reiziger");

        try (MongoCursor<Document> cursor = collection.find().iterator()) {
            while (cursor.hasNext()) {
                Document tempReiziger = cursor.next();
                String reizigerCode = (String) tempReiziger.get("code");
                String voornaam = (String) tempReiziger.get("voornaam");
                String achternaam = (String) tempReiziger.get("achternaam");
                String adres = (String) tempReiziger.get("adres");
                String postcode = (String) tempReiziger.get("postcode");
                String plaats = (String) tempReiziger.get("plaats");
                String land = (String) tempReiziger.get("land");
                String hoofdreiziger = (String) tempReiziger.get("hoofdreiziger");
                reizigers.add(
                        new Reiziger(
                                reizigerCode,
                                voornaam,
                                achternaam,
                                adres,
                                postcode,
                                plaats,
                                land,
                                hoofdreiziger
                        ));
            }
        }
    }

    public void reload() {
        load();
    }
}
