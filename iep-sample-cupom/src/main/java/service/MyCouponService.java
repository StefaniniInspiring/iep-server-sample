package service;

import org.springframework.stereotype.Service;

import com.inspiring.iep.coupon.beans.Coupon;
import com.inspiring.smarketus.commons.system.Actor;

import model.MyCoupon;

@Service
public class MyCouponService {

	public void createCoupon(MyCoupon myCoupon) {
		// logic to create coupon		
	}

	public void handleCoupon(Coupon coupon, Actor actor, String sourceState, String targetState) {
		// logic to handle coupon		
	}

}
