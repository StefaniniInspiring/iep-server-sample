package model;

import java.util.Date;
import java.util.Map;

import com.inspiring.iep.coupon.beans.Coupon;

public class MyCoupon {

	/* configured attributes */
	private String title;
	private String description;
	private String name;

	/* default coupon fields */
	private String code;
	private Date expiryDate;

	/* Coupon Attributes */
	public static final String TITLE = "title";
	public static final String NAME = "name";
	public static final String DESCRIPTION = "description";

	public MyCoupon build(Coupon iepCoupon) {
		Map<String, Object> couponAttributes = iepCoupon.getAttributes();

		this.code = iepCoupon.getCode();
		this.expiryDate = iepCoupon.getExpiryDate();
		this.title = (String) couponAttributes.get(TITLE);
		this.description = (String) couponAttributes.get(DESCRIPTION);
		this.name = (String) couponAttributes.get(NAME);

		return this;
	}

}
