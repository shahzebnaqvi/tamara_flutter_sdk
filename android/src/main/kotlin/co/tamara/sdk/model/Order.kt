package co.tamara.sdk.model

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import kotlinx.android.parcel.Parcelize

@Parcelize
internal data class Order(
    @SerializedName("billing_address") var billingAddress: Address? = null,
    var consumer: Consumer? = null,
    @SerializedName("country_code") var countryCode: String = "SA", // SA
    var description: String = "This is description", // string
    var discount: Discount? = null,
    var items: ArrayList<Item> = arrayListOf(),
    var locale: String = "en-US", // en-US
    @SerializedName("merchant_url") var merchantUrl: MerchantUrl = MerchantUrl(),
    @SerializedName("order_reference_id") var orderReferenceId: String = "", // 123456
    @SerializedName("payment_type") var paymentType: String = "PAY_BY_INSTALMENTS", // PAY_BY_LATER
    @SerializedName("shipping_address") var shippingAddress: Address? = null,
    @SerializedName("shipping_amount") var shippingAmount: Amount? = null,
    @SerializedName("tax_amount") var taxAmount: Amount? = null,
    @SerializedName("total_amount") var totalAmount: Amount? = null,
    var platform: String = "Android", //
    @SerializedName("is_mobile") var isMobile: Boolean = true,
    @SerializedName("instalments") var instalments: Int? = null
): Parcelable