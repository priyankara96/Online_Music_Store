package payment.model;

public class Payment {
	private int id;
	private String instrument;
	private String name;
	private String card;
	private String cvv;
	private String expire;
	private String amount;
	
	
	public Payment(int id, String instrument, String name, String card, String cvv, String expire, String amount) {
		super();
		this.id = id;
		this.instrument = instrument;
		this.name = name;
		this.card = card;
		this.cvv = cvv;
		this.expire = expire;
		this.amount = amount;
	}

	public Payment(String instrument, String name, String card, String cvv, String expire, String amount) {
		super();
		this.instrument = instrument;
		this.name = name;
		this.card = card;
		this.cvv = cvv;
		this.expire = expire;
		this.amount = amount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInstrument() {
		return instrument;
	}

	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public String getExpire() {
		return expire;
	}

	public void setExpire(String expire) {
		this.expire = expire;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}	

}
