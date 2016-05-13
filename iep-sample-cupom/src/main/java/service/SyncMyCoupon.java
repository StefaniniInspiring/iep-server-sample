package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.inspiring.iep.coupon.beans.Coupon;
import com.inspiring.iep.coupon.listener.CouponChangeListener;
import com.inspiring.smarketus.commons.exceptions.SmarketusException;
import com.inspiring.smarketus.commons.system.Actor;

import model.MyCoupon;

@Component("Meu Cupom")
public class SyncMyCoupon implements CouponChangeListener {

	@Autowired
	MyCouponService myCouponService;

	@Override
	public void onCouponCreation(Coupon coupon, Actor actor) throws SmarketusException {
		MyCoupon myCoupon = new MyCoupon().build(coupon);
		myCouponService.createCoupon(myCoupon);
	}

	@Override
	public void onCouponStateTransition(Coupon coupon, Actor actor, String sourceState, String targetState)
			throws SmarketusException {
		myCouponService.handleCoupon(coupon, actor, sourceState, targetState);
	}
}
